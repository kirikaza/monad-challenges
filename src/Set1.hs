{-# LANGUAGE MonadComprehensions #-}
{-# LANGUAGE RebindableSyntax #-}

module Set1 where

import MCPrelude


fiveRands :: [Integer]

fiveRands = [a, b, c, d, e]
  where
    (a,sa) = rand $ mkSeed 1
    (b,sb) = rand sa
    (c,sc) = rand sb
    (d,sd) = rand sc
    (e,se) = rand sd


randLetter :: Seed -> (Char, Seed)
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
