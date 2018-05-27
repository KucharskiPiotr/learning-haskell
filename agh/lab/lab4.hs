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
doFunc _ [] = []
doFunc func (x:list) =
    if(func x)
        then (x : (doFunc func list))
        else (doFunc func list)


-- Zadanie 4
data Node a = Node a deriving (Show)
data Tree a = Empty | Tree (Node a) (Tree a) (Tree a) deriving (Show)

insert' :: a -> Tree a -> Tree a
insert' e (Tree val Empty Empty) = Tree val (Tree (Node e) Empty Empty) Empty
insert' e (Tree val Empty r) = Tree val (Tree (Node e) Empty Empty) r
insert' e (Tree val l Empty) = Tree val l (Tree (Node e) Empty Empty)
insert' e (Tree val l r) = Tree val (insert' e l) r

empty' :: Tree a -> Bool
empty' Empty = True
empty' (Tree _ _ _) = False
