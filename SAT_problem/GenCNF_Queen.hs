module GenCNF_Queen where

import Data.List

-- It generates CNF file which taken by zChaff tool.
-- CNF file contains constraints for queen problem as clause norm form
p2i (x, y) width = width * (x - 1) + y

atLeastOneQueenInEachRow width = 
  map (\clause -> intercalate " " $ map show $ map (\p -> p2i p width) clause)
      clauses
  where clauses = [clauses | n <- [1..width], 
                            clauses <- [[clause | clause <- zip (replicate width n) [1..width]]]]

noMoreThanOneQueenInEachRow width =
  map (\(p1,p2) -> show (-1 * (p2i p1 width)) ++ " " ++ show (-1 * (p2i p2 width)))
      [((x,y1),(x,y2)) | y1<-[1..width], y2<-[y1+1..width], x <-[1..width], y1 /= y2]

noMoreThanOneQueenInEachColumn width = 
  map (\(p1,p2) -> show (-1 * (p2i p1 width)) ++ " " ++ show (-1 * (p2i p2 width)))
      [((x1,y),(x2,y)) | x1<-[1..width], x2<-[x1+1..width], y <-[1..width], x1 /= x2]

-- (1,2) (2,1) == 2 5
noMoreThanOneQueenInDiagonal width = 
  map (\(p1,p2) -> show (-1 * (p2i p1 width)) ++ " " ++ show (-1 * (p2i p2 width)))
      [((x1,y1),(x2,y2)) | x1 <- [1..width], y1 <- [1..width],
                           n  <- [-width+1..width-1],
                           x2 <- [x1 + n], y2 <- [y1 + n], 
                           x1 /= x2, y1 /= y2,
                           x2 >= 1 && x2 <= width,
                           y2 >= 1 && y2 <= width]

noMoreThanOneQueenInDiagonal2 width = 
      [((x1,y1),(x2,y2)) | x1 <- [1..width], y1 <- [1..width],
                           n  <- [-width+1..width-1],
                           x2 <- [x1 + n], y2 <- [y1 + n], 
                           x1 /= x2, y1 /= y2,
                           x2 >= 1 && x2 <= width,
                           y2 >= 1 && y2 <= width]

appendsZero:: String -> String
appendsZero clause = clause ++ " 0"


