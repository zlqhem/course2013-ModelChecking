module Properties (properties) where

import Test.QuickCheck
import Test.Framework.Providers.QuickCheck2 (testProperty)
import GenCNF_Queen

newtype SmallPoint = SmallPoint (Int, Int) deriving Show
instance Arbitrary SmallPoint where
  arbitrary = do
    x <- elements [1..5]
    y <- elements [1..5]
    return $ SmallPoint (x, y)

newtype Board = Board Int deriving Show
instance Arbitrary Board where
  arbitrary = do
    w <- elements [5..7]
    return $ Board w

propDiagonal :: Board -> SmallPoint -> SmallPoint -> Property
propDiagonal (Board w) (SmallPoint (x,y)) (SmallPoint (x2, y2)) =
  let p1 = (x,y) in
  let p2 = (x2, y2) in
  inRange w p1 ==> 
  inRange w p2 ==> case isDiagonal p1 p2 of
    True -> elem (p1,p2) constraints || elem (p2,p1) constraints
    False -> not $ elem (p1,p2) constraints || elem (p2,p1) constraints
  where constraints = noMoreThanOneQueenInDiagonal w

isDiagonal (x,y) (x2, y2) = x /= x2 && (slope == 1 || slope == -1)
  where slope = fromIntegral (y2-y) / fromIntegral (x2-x)

inRange w (x,y) = x >= 1 && x <= w &&
                  y >= 1 && y <= w 

--properties :: [Test]
properties =
  [ testProperty "no more than one queen in diagonal" propDiagonal
  ]
