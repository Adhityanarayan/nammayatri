{-
 Copyright 2022-23, Juspay India Pvt Ltd

 This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License

 as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program

 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY

 or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of

 the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Storage.Queries.Coins.CoinHistory where

import Data.Time (UTCTime (UTCTime, utctDay), addDays)
import Domain.Types.Coins.CoinHistory
import qualified Domain.Types.Person as SP
import Kernel.Beam.Functions
import Kernel.Prelude
import Kernel.Types.Id
import Kernel.Utils.Common
import qualified Sequelize as Se
import qualified Storage.Beam.Coins.CoinHistory as BeamDC

updateCoinEvent :: (MonadFlow m, CacheFlow m r, EsqDBFlow m r) => CoinHistory -> m ()
updateCoinEvent = createWithKV

getCoinEventSummary :: (MonadFlow m, CacheFlow m r, EsqDBFlow m r) => Id SP.Person -> UTCTime -> m [CoinHistory]
getCoinEventSummary (Id driverId) time = do
  let todayStart = UTCTime (utctDay time) 0
  let tomorrowStart = addUTCTime (24 * 60 * 60) todayStart
  let istOffset = - (5 * 3600 + 30 * 60)
  let todayStart' = addUTCTime istOffset todayStart
  let tomorrowStart' = addUTCTime istOffset tomorrowStart
  findAllWithOptionsKV
    [ Se.And
        [ Se.Is BeamDC.createdAt $ Se.GreaterThanOrEq todayStart',
          Se.Is BeamDC.createdAt $ Se.LessThan tomorrowStart',
          Se.Is BeamDC.driverId $ Se.Eq driverId
        ]
    ]
    (Se.Desc BeamDC.createdAt)
    Nothing
    Nothing

getTotalCoins :: (MonadFlow m, CacheFlow m r, EsqDBFlow m r) => Id SP.Person -> m [CoinHistory]
getTotalCoins (Id driverId) = do
  now <- getCurrentTime
  findAllWithKV
    [ Se.And
        [ Se.Is BeamDC.driverId $ Se.Eq driverId,
          Se.Or
            [ Se.Is BeamDC.expirationAt $ Se.GreaterThanOrEq (Just now),
              Se.Is BeamDC.expirationAt $ Se.Eq Nothing
            ]
        ]
    ]

getExpiringCoinsInXDay :: (MonadFlow m, CacheFlow m r, EsqDBFlow m r) => Id SP.Person -> NominalDiffTime -> m [CoinHistory]
getExpiringCoinsInXDay (Id driverId) configTime = do
  now <- getCurrentTime
  let futureTime = addUTCTime configTime now
  findAllWithKV
    [ Se.And
        [ Se.Is BeamDC.driverId $ Se.Eq driverId,
          Se.Is BeamDC.status $ Se.Eq Remaining,
          Se.Is BeamDC.expirationAt $ Se.GreaterThanOrEq (Just now),
          Se.Is BeamDC.expirationAt $ Se.LessThanOrEq (Just futureTime)
        ]
    ]

getCoinsEarnedLastDay :: (MonadFlow m, CacheFlow m r, EsqDBFlow m r) => Id SP.Person -> UTCTime -> m [CoinHistory]
getCoinsEarnedLastDay (Id driverId) now = do
  let todayStart = UTCTime (utctDay now) 0
  let yesterdayStart = UTCTime (addDays (-1) (utctDay now)) 0
  let istOffset = - (5 * 3600 + 30 * 60)
  let todayStart' = addUTCTime istOffset todayStart
  let yesterdayStart' = addUTCTime istOffset yesterdayStart
  findAllWithKV
    [ Se.And
        [ Se.Is BeamDC.driverId $ Se.Eq driverId,
          Se.Is BeamDC.createdAt $ Se.GreaterThanOrEq yesterdayStart',
          Se.Is BeamDC.createdAt $ Se.LessThanOrEq todayStart'
        ]
    ]

getDriverCoinInfo :: (MonadFlow m, CacheFlow m r, EsqDBFlow m r) => Id SP.Person -> m [CoinHistory]
getDriverCoinInfo (Id driverId) = do
  now <- getCurrentTime
  findAllWithOptionsKV
    [ Se.And
        [ Se.Is BeamDC.driverId $ Se.Eq driverId,
          Se.Is BeamDC.status $ Se.Eq Remaining,
          Se.Is BeamDC.expirationAt $ Se.GreaterThanOrEq (Just now)
        ]
    ]
    (Se.Asc BeamDC.expirationAt)
    Nothing
    Nothing

updateStatusOfCoins :: (MonadFlow m, CacheFlow m r, EsqDBFlow m r) => Text -> Int -> CoinStatus -> m ()
updateStatusOfCoins id coinsRemainingValue newStatus =
  updateWithKV
    [ Se.Set BeamDC.status newStatus,
      Se.Set BeamDC.coinsUsed coinsRemainingValue
    ]
    [Se.Is BeamDC.id $ Se.Eq id]

instance FromTType' BeamDC.CoinHistory CoinHistory where
  fromTType' BeamDC.CoinHistoryT {..} = do
    pure $
      Just
        CoinHistory
          { id = Id id,
            driverId = driverId,
            eventFunction = eventFunction,
            merchantId = merchantId,
            merchantOptCityId = merchantOptCityId,
            coins = coins,
            createdAt = createdAt,
            expirationAt = expirationAt,
            status = status,
            coinsUsed = coinsUsed
          }

instance ToTType' BeamDC.CoinHistory CoinHistory where
  toTType' CoinHistory {..} = do
    BeamDC.CoinHistoryT
      { BeamDC.id = getId id,
        BeamDC.driverId = driverId,
        BeamDC.createdAt = createdAt,
        BeamDC.eventFunction = eventFunction,
        BeamDC.merchantId = merchantId,
        BeamDC.merchantOptCityId = merchantOptCityId,
        BeamDC.coins = coins,
        BeamDC.expirationAt = expirationAt,
        BeamDC.status = status,
        BeamDC.coinsUsed = coinsUsed
      }