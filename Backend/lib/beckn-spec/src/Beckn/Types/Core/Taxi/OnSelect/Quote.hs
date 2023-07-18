{-
 Copyright 2022-23, Juspay India Pvt Ltd

 This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License

 as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program

 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY

 or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of

 the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Beckn.Types.Core.Taxi.OnSelect.Quote
  ( module Beckn.Types.Core.Taxi.OnSelect.Quote,
    module Reexport,
  )
where

import Beckn.Types.Core.Taxi.Common.Gps as Reexport
import Beckn.Types.Core.Taxi.OnSelect.Price as Reexport
import Data.Aeson
import Data.OpenApi (ToSchema (..), defaultSchemaOptions)
import EulerHS.Prelude
import Kernel.Utils.Schema (genericDeclareUnNamedSchema)

data Quote = Quote
  { price :: Price,
    ttl :: Maybe Text,
    breakup :: Maybe [PriceBreakup]
  }
  deriving (Generic, Show, ToJSON, FromJSON)

instance ToSchema Quote where
  declareNamedSchema = genericDeclareUnNamedSchema defaultSchemaOptions