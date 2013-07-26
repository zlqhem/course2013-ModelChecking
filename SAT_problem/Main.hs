module Main where

import System.Environment
import Data.List
import GenCNF_Queen

main = do
  args <- getArgs
  case args of
    [] -> print "Usage: prob-queen <board-size>"
    otherwise -> do
      let width = read (head args) :: Int 
      let allClauses = foldl (\acc f -> acc ++ f width) []
                             [atLeastOneQueenInEachRow,
                              noMoreThanOneQueenInEachRow,
                              noMoreThanOneQueenInEachColumn,
                              noMoreThanOneQueenInDiagonal] 
      putStrLn $ "p cnf " ++ show (width * width) ++ " " ++ show (length allClauses)
      putStrLn $ intercalate "\n" $ map appendsZero allClauses

