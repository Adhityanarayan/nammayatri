{-
 Copyright 2022-23, Juspay India Pvt Ltd

 This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License

 as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program

 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY

 or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of

 the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Storage.Queries.DriverPlan where

import Domain.Types.DriverPlan
import Domain.Types.Mandate
import Domain.Types.Person
import Domain.Types.Plan
import qualified EulerHS.Language as L
import Kernel.Beam.Functions
import Kernel.Prelude
import Kernel.Types.Id
import Kernel.Types.Logging (Log)
import Kernel.Types.Time
import qualified Sequelize as Se
import qualified Storage.Beam.DriverPlan as BeamDF

create :: (L.MonadFlow m, Log m) => DriverPlan -> m ()
create = createWithKV

findByDriverId :: (L.MonadFlow m, Log m) => Id Person -> m (Maybe DriverPlan)
findByDriverId (Id driverId) = findOneWithKV [Se.Is BeamDF.driverId $ Se.Eq driverId]

findByMandateId :: (L.MonadFlow m, Log m) => Id Mandate -> m (Maybe DriverPlan)
findByMandateId (Id mandateId) = findOneWithKV [Se.Is BeamDF.mandateId $ Se.Eq (Just mandateId)]

updatePlanIdByDriverId :: (L.MonadFlow m, Log m, MonadTime m) => Id Person -> Id Plan -> m ()
updatePlanIdByDriverId (Id driverId) (Id planId) = do
  now <- getCurrentTime
  updateOneWithKV
    [Se.Set BeamDF.planId planId, Se.Set BeamDF.updatedAt now]
    [Se.Is BeamDF.driverId (Se.Eq driverId)]

updateMandateIdByDriverId :: (L.MonadFlow m, Log m, MonadTime m) => Id Person -> Id Mandate -> m ()
updateMandateIdByDriverId driverId (Id mandateId) = do
  now <- getCurrentTime
  updateOneWithKV
    [Se.Set BeamDF.mandateId (Just mandateId), Se.Set BeamDF.updatedAt now]
    [Se.Is BeamDF.driverId (Se.Eq (getId driverId))]

updatePaymentModeByDriverId :: (L.MonadFlow m, Log m, MonadTime m) => Id Person -> PaymentMode -> m ()
updatePaymentModeByDriverId driverId paymentMode = do
  now <- getCurrentTime
  updateOneWithKV
    [ Se.Set BeamDF.planType paymentMode,
      Se.Set BeamDF.updatedAt now
    ]
    [Se.Is BeamDF.driverId (Se.Eq (getId driverId))]

instance FromTType' BeamDF.DriverPlan DriverPlan where
  fromTType' BeamDF.DriverPlanT {..} = do
    pure $
      Just
        DriverPlan
          { driverId = Id driverId,
            planId = Id planId,
            planType = planType,
            mandateId = Id <$> mandateId,
            createdAt = createdAt,
            updatedAt = updatedAt
          }

instance ToTType' BeamDF.DriverPlan DriverPlan where
  toTType' DriverPlan {..} = do
    BeamDF.DriverPlanT
      { BeamDF.driverId = getId driverId,
        BeamDF.planId = getId planId,
        BeamDF.planType = planType,
        BeamDF.mandateId = getId <$> mandateId,
        BeamDF.createdAt = createdAt,
        BeamDF.updatedAt = updatedAt
      }