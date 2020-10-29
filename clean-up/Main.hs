module Main where

import Control.Monad (filterM)
import System.Directory

icdHistoryPath :: IO FilePath
icdHistoryPath = (++ "/.history.icd") <$> getHomeDirectory

cleanUpInvalid :: [FilePath] -> IO [FilePath]
cleanUpInvalid = filterM doesDirectoryExist

main :: IO ()
main = do
  historyFilePath <- icdHistoryPath
  filtered <- readFile historyFilePath >>= cleanUpInvalid . lines
  writeFile historyFilePath (unlines filtered)
