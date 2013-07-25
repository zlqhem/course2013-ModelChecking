module Properties (properties) where

import Test.QuickCheck
import Test.Framework.Providers.QuickCheck2 (testProperty)
import GenCNF_Queen

propDiagonal :: Int -> (Int, Int) -> (Int, Int) -> Property
propDiagonal w p1@(x,y) p2@(x2, y2) =
  isDiagonal p1 p2 ==> 
  inRange w p1 ==> 
  inRange w p2 ==> elem (p1,p2) constraints
  where constraints = noMoreThanOneQueenInDiagonal2 w

isDiagonal (x,y) (x2, y2) = x /= x2 && (slope == 1 || slope == -1)
  where slope = (y2-y) `div` (x2-x)

inRange w (x,y) = x >= 1 && x <= w &&
                  y >= 1 && y <= w &&
                  w >= 1 && w <= 30

--properties :: [Test]
properties =
  [ testProperty "no more than one queen in diagonal" propDiagonal
  ]
