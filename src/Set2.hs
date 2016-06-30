{-# LANGUAGE MonadComprehensions #-}
{-# LANGUAGE RebindableSyntax #-}

module Set2 where

import MCPrelude


data Maybe a = Nothing | Just a

instance Show a => Show (Maybe a) where
  show Nothing = "Nothing"
  show (Just x) = "Just " ++ show x


headMay :: [a] -> Maybe a
headMay [] = Nothing
headMay (x:_) = Just x

tailMay :: [a] -> Maybe [a]
tailMay [] = Nothing
tailMay (_:xs) = Just xs

lookupMay :: Eq a => a -> [(a, b)] -> Maybe b
lookupMay _ [] = Nothing
lookupMay x (pair@(k, v):pairs) = if k == x then Just v else lookupMay x pairs

divMay :: (Eq a, Fractional a) => a -> a -> Maybe a
divMay _ 0 = Nothing
divMay p q = Just (p / q)

maximumMay :: Ord a => [a] -> Maybe a
maximumMay [] = Nothing
maximumMay (x:xs) = Just $ case maximumMay xs of
  Nothing -> x
  Just max -> if x > max then x else max

minimumMay :: Ord a => [a] -> Maybe a
minimumMay [] = Nothing
minimumMay (x:xs) = Just $ case minimumMay xs of
  Nothing -> x
  Just min -> if x < min then x else min


queryGreek :: GreekData -> String -> Maybe Double
queryGreek greeks name = case lookupMay name greeks of
  Nothing -> Nothing
  Just values -> case tailMay values of
    Nothing -> Nothing
    Just tail -> case maximumMay tail of
      Nothing -> Nothing
      Just max -> case headMay values of
        Nothing -> Nothing
        Just head -> divMay (fromIntegral max) (fromIntegral head)
