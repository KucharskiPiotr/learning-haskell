-- . oznacza że trzeba odpalić jedną funkcję a potem drugą
-- ($) - wymusza ewaluację x z wysokim priorytetem, np:
-- ($) f x = f x

-- Mechanizmy które pomagają w programowaniu:
--  * Abstrakcja - czyli na przykład funkcja
--  * Kompozycja - sklejanie abstrakcji w całość

-- Deklaracja funckcji
sum' [] = 0
sum' (x:xs) = x + sum xs
-- Mozna sobie deklarowac to wszystko tak po prostu, product, and, or itd...
-- Ale mozna sobie pomoc: korzystamy z fold:
-- Np. dodawanie listy:
-- foldr (+) 0 [1..4] 
-- Oznacza: foldr (operacja) wartość_początkowa argument
-- Takie coś można sobie zapisać do zmiennej, np:
-- s = foldr (+) 0
-- Wywołanie: s [1..4]

-- Implementacja foldr - wygodne dla nieskoenczonych ciagów
foldr' f a [] = a
foldr' f a (x:xs) = f x (foldr f a xs)

-- Implementacja foldl - próbuje zjeść całą listę (pakuje na stos) i dopiero cokoliwek robi
foldl' f a [] = a
foldl' f a (x:xs) = foldl f (f a x) xs

-- Wypisywanie na ekran:
--      putStrLn "Tekst"
-- Nie jest to funkcja jak każda inna, bo wypisuje na świat zewnętrzny a nie zwraca
-- po wpisaniu :t putStrLn otrzymamy:
-- putStrLn :: String -> IO ()
-- Oznacza to że funkcja ta bierze napis i zwraca jakieś coś co jest efektem ubocznym
-- To jest niesamowitee xD
-- IO () to jest cały świat

-- Zeby osiagnac pewna kolejnosc wykonywania polecen trzeba posklejać te instrukcje
-- w jedną całłą funkcję

-- Oczyt z STDIN - ze świata
--      getLine
-- Wystarczy numerowac akcje zeby miec je po kolei

-- Monady - coś ważnego xd, Interfejs pozwalający na łączenie funckji w taki sposób że funkcja
-- bierze a, zwraca b opakowane w c czy tam d