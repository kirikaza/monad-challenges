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
    
