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

-- Ogarnij sobie ten kodzik:
class Monoid m where 
    mempty :: m
    mappend :: m -> m -> m

mappend === (<>)

x <> mempty = x
mempty <> x = 

-- Praca na monolicie: to nie są liczby tylko określony
-- typ i w ogóle. 

-- Fun fact: jQuery jest monolitem

-- w monadzie IO jest zapakowana kolejność jak coś ma 
-- sie wykonać jedno poo