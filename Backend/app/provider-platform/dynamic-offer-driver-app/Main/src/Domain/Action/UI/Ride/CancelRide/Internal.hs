{-
 Copyright 2022-23, Juspay India Pvt Ltd

 This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License

 as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program

 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY

 or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of

 the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Domain.Action.UI.Ride.CancelRide.Internal (cancelRideImpl) where

import qualified Domain.Types.Booking as SRB
import qualified Domain.Types.BookingCancellationReason as SBCR
import qualified Domain.Types.Common as DTC
import qualified Domain.Types.Merchant as DMerc
import qualified Domain.Types.Ride as DRide
import Environment
import Kernel.Prelude
import qualified Kernel.Storage.Esqueleto as Esq hiding (whenJust_)
import Kernel.Storage.Hedis as Redis
import Kernel.Types.Id
import Kernel.Utils.Common
import qualified Lib.DriverScore as DS
import qualified Lib.DriverScore.Types as DST
import SharedLogic.Allocator.Jobs.SendSearchRequestToDrivers (sendSearchRequestToDrivers')
import qualified SharedLogic.CallBAP as BP
import SharedLogic.DriverPool
import qualified SharedLogic.DriverPool as DP
import qualified SharedLogic.External.LocationTrackingService.Flow as LF
import qualified SharedLogic.External.LocationTrackingService.Types as LT
import SharedLogic.FarePolicy
import SharedLogic.Ride (multipleRouteKey, searchRequestKey)
import SharedLogic.SearchTry
import qualified Storage.CachedQueries.Driver.GoHomeRequest as CQDGR
import qualified Storage.CachedQueries.Merchant as CQM
import Storage.CachedQueries.Merchant.TransporterConfig as QMTC
import qualified Storage.CachedQueries.Merchant.TransporterConfig as QTC
import qualified Storage.CachedQueries.ValueAddNP as CQVAN
import qualified Storage.CachedQueries.VehicleServiceTier as CQDVST
import qualified Storage.Queries.Booking as QRB
import qualified Storage.Queries.BookingCancellationReason as QBCR
import qualified Storage.Queries.DriverInformation as QDI
import qualified Storage.Queries.DriverQuote as QDQ
import qualified Storage.Queries.DriverStats as QDriverStats
import qualified Storage.Queries.Estimate as QEst
import qualified Storage.Queries.Person as QPerson
import qualified Storage.Queries.Ride as QRide
import qualified Storage.Queries.SearchRequest as QSR
import qualified Storage.Queries.SearchTry as QST
import qualified Storage.Queries.Vehicle as QVeh
import Tools.Error
import Tools.Event
import qualified Tools.Notifications as Notify

cancelRideImpl :: Id DRide.Ride -> DRide.RideEndedBy -> SBCR.BookingCancellationReason -> Flow ()
cancelRideImpl rideId rideEndedBy bookingCReason = do
  ride <- QRide.findById rideId >>= fromMaybeM (RideDoesNotExist rideId.getId)
  booking <- QRB.findById ride.bookingId >>= fromMaybeM (BookingNotFound ride.bookingId.getId)
  isValueAddNP <- CQVAN.isValueAddNP booking.bapId
  let merchantId = booking.providerId
  merchant <-
    CQM.findById merchantId
      >>= fromMaybeM (MerchantNotFound merchantId.getId)
  cancelRideTransaction booking ride bookingCReason merchantId rideEndedBy
  logTagInfo ("rideId-" <> getId rideId) ("Cancellation reason " <> show bookingCReason.source)
  driver <- QPerson.findById ride.driverId >>= fromMaybeM (PersonNotFound ride.driverId.getId)
  vehicle <- QVeh.findById ride.driverId >>= fromMaybeM (DriverWithoutVehicle ride.driverId.getId)

  fork "cancelRide - Notify driver" $ do
    triggerRideCancelledEvent RideEventData {ride = ride{status = DRide.CANCELLED}, personId = driver.id, merchantId = merchantId}
    triggerBookingCancelledEvent BookingEventData {booking = booking{status = SRB.CANCELLED}, personId = driver.id, merchantId = merchantId}
    when (bookingCReason.source == SBCR.ByDriver) $
      DS.driverScoreEventHandler ride.merchantOperatingCityId DST.OnDriverCancellation {merchantId = merchantId, driverId = driver.id, rideFare = Just booking.estimatedFare}
    Notify.notifyOnCancel ride.merchantOperatingCityId booking driver.id driver.deviceToken bookingCReason.source

  fork "cancelRide - Notify BAP" $ do
    case booking.tripCategory of
      DTC.OneWay DTC.OneWayOnDemandDynamicOffer -> do
        -- in this case only do the reallocation
        driverQuote <- QDQ.findById (Id booking.quoteId) >>= fromMaybeM (QuoteNotFound booking.quoteId)
        searchTry <- QST.findById driverQuote.searchTryId >>= fromMaybeM (SearchTryNotFound driverQuote.searchTryId.getId)
        searchReq <- QSR.findById searchTry.requestId >>= fromMaybeM (SearchRequestNotFound searchTry.requestId.getId)
        transpConf <- QTC.findByMerchantOpCityId searchReq.merchantOperatingCityId (Just booking.transactionId) (Just "transactionId") >>= fromMaybeM (TransporterConfigNotFound searchReq.merchantOperatingCityId.getId)
        let searchRepeatLimit = transpConf.searchRepeatLimit
        now <- getCurrentTime
        let isSearchTryValid = searchTry.validTill > now
        transporterConfig <- QMTC.findByMerchantOpCityId booking.merchantOperatingCityId (Just booking.transactionId) (Just "transactionId") >>= fromMaybeM (TransporterConfigNotFound booking.merchantOperatingCityId.getId)
        let arrivedPickupThreshold = highPrecMetersToMeters transporterConfig.arrivedPickupThreshold
        let driverHasNotArrived = isNothing ride.driverArrivalTime || maybe True (> arrivedPickupThreshold) bookingCReason.driverDistToPickup
        let isRepeatSearch =
              searchTry.searchRepeatCounter < searchRepeatLimit
                && bookingCReason.source == SBCR.ByDriver
                && isSearchTryValid
                && fromMaybe False searchReq.isReallocationEnabled
                && driverHasNotArrived
        if isRepeatSearch
          then do
            estimate <- QEst.findById driverQuote.estimateId >>= fromMaybeM (EstimateNotFound driverQuote.estimateId.getId)
            DP.addDriverToSearchCancelledList searchReq.id ride.driverId
            vehicleServiceTierName <-
              case estimate.vehicleServiceTierName of
                Just name -> return name
                _ -> do
                  item <- CQDVST.findByServiceTierTypeAndCityId estimate.vehicleServiceTier booking.merchantOperatingCityId >>= fromMaybeM (VehicleServiceTierNotFound $ show estimate.vehicleServiceTier)
                  return item.name
            let tripQuoteDetails =
                  [ TripQuoteDetail
                      { tripCategory = booking.tripCategory,
                        vehicleServiceTier = booking.vehicleServiceTier,
                        vehicleServiceTierName,
                        baseFare = booking.estimatedFare,
                        driverMinFee = Just 0,
                        driverMaxFee = Just $ estimate.maxFare - estimate.minFare,
                        driverPickUpCharge = estimate.driverPickUpCharge,
                        estimateOrQuoteId = estimate.id.getId
                      }
                  ]
            let driverSearchBatchInput =
                  DriverSearchBatchInput
                    { sendSearchRequestToDrivers = sendSearchRequestToDrivers',
                      merchant,
                      searchReq,
                      tripQuoteDetails,
                      customerExtraFee = searchTry.customerExtraFee,
                      messageId = searchTry.messageId,
                      isRepeatSearch
                    }
            result <- try @_ @SomeException (initiateDriverSearchBatch driverSearchBatchInput)
            case result of
              Right _ -> do
                if isValueAddNP
                  then BP.sendEstimateRepetitionUpdateToBAP booking ride (Id searchTry.estimateId) bookingCReason.source driver vehicle
                  else cancelRideTransactionForNonReallocation booking (Just searchTry.estimateId) merchant bookingCReason.source
              Left _ -> cancelRideTransactionForNonReallocation booking (Just searchTry.estimateId) merchant bookingCReason.source
          else -- repeatSearch merchant farePolicy searchReq searchTry booking ride SBCR.ByDriver now driverPoolCfg
            cancelRideTransactionForNonReallocation booking (Just searchTry.estimateId) merchant bookingCReason.source
      _ -> cancelRideTransactionForNonReallocation booking Nothing merchant bookingCReason.source
  where
    cancelRideTransactionForNonReallocation booking mbEstimateId merchant bookingCancellationReason = do
      Redis.del $ multipleRouteKey booking.transactionId
      Redis.del $ searchRequestKey booking.transactionId
      whenJust mbEstimateId $ \estimateId ->
        void $ clearCachedFarePolicyByEstOrQuoteId estimateId
      void $ clearCachedFarePolicyByEstOrQuoteId booking.quoteId
      BP.sendBookingCancelledUpdateToBAP booking merchant bookingCancellationReason

cancelRideTransaction ::
  ( EsqDBFlow m r,
    CacheFlow m r,
    Esq.EsqDBReplicaFlow m r,
    LT.HasLocationService m r
  ) =>
  SRB.Booking ->
  DRide.Ride ->
  SBCR.BookingCancellationReason ->
  Id DMerc.Merchant ->
  DRide.RideEndedBy ->
  m ()
cancelRideTransaction booking ride bookingCReason merchantId rideEndedBy = do
  let driverId = cast ride.driverId
  void $ CQDGR.setDriverGoHomeIsOnRideStatus ride.driverId booking.merchantOperatingCityId False
  QDI.updateOnRide False (cast ride.driverId)
  void $ LF.rideDetails ride.id DRide.CANCELLED merchantId ride.driverId booking.fromLocation.lat booking.fromLocation.lon
  void $ QRide.updateStatus ride.id DRide.CANCELLED
  void $ QRide.updateRideEndedBy ride.id rideEndedBy
  QBCR.upsert bookingCReason
  void $ QRB.updateStatus booking.id SRB.CANCELLED
  when (bookingCReason.source == SBCR.ByDriver) $ QDriverStats.updateIdleTime driverId
