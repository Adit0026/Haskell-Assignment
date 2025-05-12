module Main where

data YearStats = YearStats
  { yr :: Int        
  , warImpact :: Double   
  , economyGrowth :: Double 
  , trustLevel :: Double  
  }

yearStatsList :: [YearStats]
yearStatsList =
  [ YearStats 1954 0.2 0.03 0.8
  , YearStats 1955 0.3 0.025 0.75
  , YearStats 1956 0.5 0.02 0.7
  , YearStats 1957 0.6 0.015 0.65
  , YearStats 1958 0.7 0.01 0.6
  , YearStats 1959 0.6 0.015 0.65
  , YearStats 1960 0.5 0.02 0.7
  , YearStats 1961 0.4 0.025 0.75
  , YearStats 1962 0.3 0.03 0.8
  ]

calculateNewFranc :: YearStats -> Double -> Double
calculateNewFranc (YearStats _ war eco trust) oldValue =
  let penalty   = war * 0.3     
      bonus     = eco * 0.2       
      boost     = trust * 0.5   
      change    = bonus + boost - penalty
  in oldValue * (1 + change)

simulateAllYears :: Double -> [YearStats] -> IO ()
simulateAllYears _ [] = return ()
simulateAllYears currentValue (ys:rest) = do
  let year = yr ys
      newValue = calculateNewFranc ys currentValue
  putStrLn $ show year ++ ": Franc = " ++ show (roundTo2 newValue)
  simulateAllYears newValue rest

roundTo2 :: Double -> Double
roundTo2 x = fromIntegral (round $ x * 100) / 100.0

main :: IO ()
main = do
  let startFranc = 100.0
  simulateAllYears startFranc yearStatsList
