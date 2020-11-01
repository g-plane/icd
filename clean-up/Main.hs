module Main where

import Control.Monad (filterM)
import Data.Functor
import System.Directory

icdHistoryPath :: IO FilePath
icdHistoryPath = getHomeDirectory <&> (++ "/.history.icd")

cleanUpInvalid :: [FilePath] -> IO [FilePath]
cleanUpInvalid = filterM doesDirectoryExist

main :: IO ()
main = do
  historyFilePath <- icdHistoryPath
  filtered <- readFile historyFilePath >>= cleanUpInvalid . lines
  writeFile historyFilePath (unlines filtered)
