{-# LANGUAGE MonadComprehensions #-}
{-# LANGUAGE RebindableSyntax #-}

module Set1 where

import MCPrelude


type Gen v = Seed -> (v, Seed)


fiveRands :: [Integer]

fiveRands = [a, b, c, d, e]
  where
    (a,sa) = rand $ mkSeed 1
    (b,sb) = rand sa
    (c,sc) = rand sb
    (d,sd) = rand sc
    (e,se) = rand sd


randLetter :: Gen Char
randString3 :: String

randLetter seed = (letter, nextSeed)
  where
    (num,nextSeed) = rand seed
    letter = toLetter num

randString3 = [a, b, c]
  where
    (a,sa) = randLetter $ mkSeed 1
    (b,sb) = randLetter sa
    (c,sc) = randLetter sb


generalA :: (a -> b) -> Gen a -> Gen b
randEven :: Gen Integer
randOdd :: Gen Integer
randTen :: Gen Integer

generalA trans base seed = (trans value, nextSeed)
  where
    (value, nextSeed) = base seed

randEven = generalA (*2) rand
randOdd = generalA (+1) randEven
randTen = generalA (*10) rand


randPair :: Gen (Char, Integer)
generalPair :: Gen a -> Gen b -> Gen (a,b)
generalB :: (a -> b -> c) -> Gen a -> Gen b -> Gen c
generalPair2 :: Gen a -> Gen b -> Gen (a,b)

randPair seed = ((char, int), seed'')
  where
    (char, seed') = randLetter seed
    (int, seed'') = rand seed'

generalPair g1 g2 seed = ((v1,v2), seed'')
  where
    (v1,seed') = g1 seed
    (v2,seed'') = g2 seed'

generalB ctor g1 g2 seed = (ctor v1 v2, seed'')
  where
    (v1,seed') = g1 seed
    (v2,seed'') = g2 seed'

generalPair2 = generalB (,)
