{-
 Copyright 2022-23, Juspay India Pvt Ltd

 This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License

 as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program

 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY

 or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of

 the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Storage.Clickhouse.RideDetails where

import qualified Domain.Types.RideDetails as DRD
import Kernel.Prelude
import Kernel.Storage.ClickhouseV2 as CH
import qualified Kernel.Storage.ClickhouseV2.UtilsTH as TH
import Kernel.Types.Id

data RideDetailsT f = RideDetailsT
  { id :: C f (Id DRD.RideDetails),
    vehicleNumber :: C f (Maybe Text),
    fleetOwnerId :: C f (Maybe Text)
  }
  deriving (Generic)

deriving instance Show RideDetails

rideDetailsTTable :: RideDetailsT (FieldModification RideDetailsT)
rideDetailsTTable =
  RideDetailsT
    { id = "id",
      vehicleNumber = "vehicle_number",
      fleetOwnerId = "fleet_owner_id"
    }

type RideDetails = RideDetailsT Identity

$(TH.mkClickhouseInstances ''RideDetailsT)

findIdsByFleetOwner ::
  CH.HasClickhouseEnv CH.APP_SERVICE_CLICKHOUSE m =>
  Maybe Text ->
  m [Id DRD.RideDetails]
findIdsByFleetOwner fleetOwnerId = do
  CH.findAll $
    CH.select_ (\rd -> CH.notGrouped (rd.id)) $
      CH.filter_
        ( \riderDetails _ ->
            riderDetails.fleetOwnerId CH.==. fleetOwnerId
        )
        (CH.all_ @CH.APP_SERVICE_CLICKHOUSE rideDetailsTTable)

findIdsByFleetOwnerAndVehicle ::
  CH.HasClickhouseEnv CH.APP_SERVICE_CLICKHOUSE m =>
  Maybe Text ->
  Text ->
  m [Id DRD.RideDetails]
findIdsByFleetOwnerAndVehicle fleetOwnerId vehicleNumber = do
  CH.findAll $
    CH.select_ (\rd -> CH.notGrouped (rd.id)) $
      CH.filter_
        ( \rideDetails _ ->
            rideDetails.fleetOwnerId CH.==. fleetOwnerId
              CH.&&. rideDetails.vehicleNumber CH.==. Just vehicleNumber
        )
        (CH.all_ @CH.APP_SERVICE_CLICKHOUSE rideDetailsTTable)
