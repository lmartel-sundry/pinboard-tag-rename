module Lib
       (
         rename
       ) where

import Data.Maybe
import qualified Pinboard
import System.Environment

rename :: Pinboard.Old -> Pinboard.New -> IO ()
rename from to = do
  token <- fromJust <$> lookupEnv "PINBOARD_TOKEN"
  let config = Pinboard.fromApiToken token
  result <- Pinboard.runPinboard config $ Pinboard.renameTag from to
  case result of
    Right _ -> putStrLn "Done."
    Left err -> print err
