{-# LANGUAGE FlexibleInstances #-}
import Data.Char
import Data.List

-- Zadanie 1
class Intable a where
    toInt :: a -> Int

instance Intable Char where
    toInt x = digitToInt x

instance Intable [Char] where
    toInt num = read num :: Int

mySuperAdd :: (Intable a) => a -> a -> Int
mySuperAdd x y = toInt x + toInt y


-- Zadanie 2
data Osoba = Osoba 
    {
        imie :: String,
        nazwisko :: String,
        pesel :: String
    } deriving (Show)

instance Eq Osoba where
    (==) x y = (pesel x) == (pesel y)

instance Ord Osoba where
    (<) x y = (pesel x) < (pesel y)
    (>) x y = (pesel x) > (pesel y)
    

-- Zadanie 3
comparePesel :: String -> Osoba -> Bool
comparePesel str oso = str == pesel oso

findID :: (a -> Bool) -> [a] -> Maybe a
findID _ [] = Nothing
findID lambda (x:list)  | lambda x = Just x
                        | otherwise = findID lambda list