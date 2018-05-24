{-# LANGUAGE FlexibleInstances #-}

import Data.Char

class Intable a where
    toInt :: a -> Int

instance Intable Char where
    toInt x = digitToInt x

instance Intable [Char] where
    toInt (x:list) = (digitToInt x) : (toInt list)

mySuperAdd :: (Intable a) => a -> a -> Int
mySuperAdd x y = toInt x + toInt y
