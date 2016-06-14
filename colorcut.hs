
import Data.Hashable

main = do
  interact $ unlines . map (\x -> mapLine x) . lines

mapWords :: String -> String
mapWords =
  unwords . map (\x -> (colorForStr x) ++ x ++ resetColor) . words

mapLine :: String -> String
mapLine x =
  (colorForStr x) ++ x ++ resetColor

resetColor =
  "\x1b[0m"
  
colorForStr :: String -> String
colorForStr s =
  "\x1b[" ++ show (hashColor s) ++ "m"
  
hashColor :: String -> Int
hashColor s =
  (mod (hash s) 8) + 30
