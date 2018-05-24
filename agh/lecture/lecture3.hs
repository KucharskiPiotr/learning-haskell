-- Typy są bardzo ważne, składa się funkcje kropką.
-- przykład funckji map:
map :: (a->b) -> [a] -> [b]
map :: (a->b) -> [] a -> [] b
map :: (a->b) -> t a -> t b

class Functor f where
    fmap :: (a->b) -> f a -> f b

-- Implementacja listy która nie może istnieć jako 
-- pusta lista (zawsze co najmniej 1 element)
-- Musi nie być konstruktora pustego
data Nel a = Nel a [a]

-- Unia (typ to albo A albo B):
data Foo = A | B deriving Show

nelMap f (Nel a as) = Nel (f a) (map f as)