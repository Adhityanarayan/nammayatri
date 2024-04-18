{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}

module Storage.Beam.Estimate where

import qualified Database.Beam as B
import qualified Domain.Types.Common
import qualified Domain.Types.ServiceTierType
import Kernel.External.Encryption
import Kernel.Prelude
import qualified Kernel.Prelude
import qualified Kernel.Types.Common
import Tools.Beam.UtilsTH

data EstimateT f = EstimateT
  { createdAt :: B.C f Kernel.Prelude.UTCTime,
    driverPickUpCharge :: B.C f (Kernel.Prelude.Maybe Kernel.Types.Common.Money),
    estimatedDistance :: B.C f (Kernel.Prelude.Maybe Kernel.Types.Common.Meters),
    fareParamsId :: B.C f (Kernel.Prelude.Maybe Kernel.Prelude.Text),
    farePolicyId :: B.C f (Kernel.Prelude.Maybe Kernel.Prelude.Text),
    id :: B.C f Kernel.Prelude.Text,
    isScheduled :: B.C f (Kernel.Prelude.Maybe Kernel.Prelude.Bool),
    maxFare :: B.C f Kernel.Types.Common.Money,
    minFare :: B.C f Kernel.Types.Common.Money,
    requestId :: B.C f Kernel.Prelude.Text,
    specialLocationTag :: B.C f (Kernel.Prelude.Maybe Kernel.Prelude.Text),
    tripCategory :: B.C f (Kernel.Prelude.Maybe Domain.Types.Common.TripCategory),
    updatedAt :: B.C f (Kernel.Prelude.Maybe Kernel.Prelude.UTCTime),
    vehicleVariant :: B.C f Domain.Types.ServiceTierType.ServiceTierType,
    vehicleServiceTierName :: B.C f (Kernel.Prelude.Maybe Kernel.Prelude.Text)
  }
  deriving (Generic, B.Beamable)

instance B.Table EstimateT where
  data PrimaryKey EstimateT f = EstimateId (B.C f Kernel.Prelude.Text) deriving (Generic, B.Beamable)
  primaryKey = EstimateId . id

type Estimate = EstimateT Identity

$(enableKVPG ''EstimateT ['id] [])

$(mkTableInstancesWithTModifier ''EstimateT "estimate" [])
