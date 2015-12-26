module Main where

import qualified Data.Text as Text
import Lib
import System.Environment

main :: IO ()
main = do
  args <- getArgs
  case args of
    [from, to] -> rename (Text.pack from) (Text.pack to)
    _ -> putStrLn "Usage: pinboard-tag-rename OLD_TAG NEW_TAG"
