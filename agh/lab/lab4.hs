{-# LANGUAGE FlexibleInstances #-}

import Data.Char

class Intable a where
    toInt :: a -> Int

instance Intable Char where
    toInt x = digitToInt x

instance Intable [Char] where
    toInt num = read num :: Int

mySuperAdd :: (Intable a) => a -> a -> Int
mySuperAdd x y = toInt x + toInt y
