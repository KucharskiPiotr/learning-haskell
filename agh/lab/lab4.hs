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

-- Apostrophe is for making function different from the one from library
insert' :: a -> Tree a -> Tree a
insert' e (Tree val Empty Empty) = Tree val (Tree (Node e) Empty Empty) Empty
insert' e (Tree val Empty r) = Tree val (Tree (Node e) Empty Empty) r
insert' e (Tree val l Empty) = Tree val l (Tree (Node e) Empty Empty)
insert' e (Tree val l r) = Tree val (insert' e l) r

-- Apostrophe is for making function different from the one from library
empty' :: Tree a -> Bool
empty' Empty = True
empty' (Tree _ _ _) = False

search :: (Eq a) => a -> Tree a -> Bool
search e (Tree (Node x) Empty Empty) = e == x
search e (Tree (Node x) l r)    | e == x = True
                                | otherwise = (search e l) || (search e r)

toString :: (Show a) => Tree a -> String
toString Empty = ""
toString (Tree (Node x) l r) = 
    ((show x) :: String) ++ "(" ++ (toString l) ++ "," ++ (toString r) ++ ")"

leaves :: Tree a -> [a]
leaves (Tree (Node x) Empty Empty) = [x]
leaves (Tree (Node x) l Empty) = x : (leaves l)
leaves (Tree (Node x) Empty r) = x : (leaves r)
leaves (Tree (Node x) l r) = x : ((leaves l) ++ (leaves r))

nnodes :: Tree a -> Int
nnodes (Tree (Node x) Empty Empty) = 1
nnodes (Tree (Node x) l Empty) = (nnodes l) + 1
nnodes (Tree (Node x) Empty r) = (nnodes r) + 1
nnodes (Tree (Node x) l r) = (nnodes l) + (nnodes r) + 1

nsum :: Tree Int -> Int
nsum (Tree (Node x) Empty Empty) = x
nsum (Tree (Node x) l Empty) = (nsum l) + x
nsum (Tree (Node x) Empty r) = (nsum r) + x
nsum (Tree (Node x) l r) = (nsum l) + (nsum r) + x

