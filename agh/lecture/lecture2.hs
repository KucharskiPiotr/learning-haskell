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
-- bierze a, zwraca b opakowane w c czy tam d. Określa się kolejnośc wywoływania funkcji

-- Przykład kompuzycji funkcji która musi mieć rzeczy po kolei:
--      echo = getChar >>= putChar
-- pozwala na naciśnięcie klawisza i wypisania jego id
-- Operator >>= pozwala na stworzenie tego połączenia ( biblioteka Controls.Monad )

-- Definicja typu opcjonalnego : 
data Maybe a = Just a | Nothing
-- Podstawowy moduł generowania porażki, albo będzie dobre rozwiązanie i po prostu się coś 
-- zwraca bo się udało, inaczej zwróć nic xd np. dzielenie przez 0, jak sie uda to zwróć,
-- jak nei to zwróć nic

-- Można dać funkcji że zwraca 0 1 lub wiele wartości, wtedy deklaracja typów:
-- Maybe a -> (a -> Maybe b) -> Maybe b
-- Jeżeli gdziekolwiek po drodze wyrzucone zostanie nic to nie idź dalej tylko wyrzuć nic
-- robi się to za pomocą operatora (>>=) - /nazwa tego operatora to bind/:
-- (>>=) Maybe a -> (a -> Maybe b) -> Maybe b
-- Dążymy do tego żeby rozłożyć wszystko na poszczególne kawałki 
-- (po kolei, bułka, sałata, mięso itd a nie mielonka)

-- Definicja tego operatora żeby to działało:
-- Implementacja:
-- Maybe a -> (a -> Maybe b) -> Maybe b
Just a >>= f = f a
Nothing >>= f = Nothing

-- Just tworzy z tej "zmiennej" zmienną typu Maybe (a -> Maybe a)
-- Za pomoca tego co napisalismy w wykorzystaniu f nie trzeba sprawdzac wiecej if costam == null
-- JEst cos co może się nie udać zatem zamykamy to w funkcji i samo się sprawdza i obsługuje

-- Jak cos się powtarza to tworzymy abstrakcję to towrzymy coś żeby było uporządkowane
-- Za pomocą tego wszystkiego można utrzymać kod w dobrym stanie
-- po więcej informacji: :i Maybe

-- Wykorzystanie:
f1 a = if a > 3 then return 1 else Nothing
-- W zależności od tego jaki jest kontekst to taką 1 zwróci
-- Po wywołaniu f1 3 dostniemy błąd, ale jak damy f1 3 :: Maybe Int zwróci nam Nothing

-- Przykład składania
-- ghci> return 4 >>= f1 >>= f1 :: Maybe Int

-- Takie funkcje:

sqrEq a b c =
    let delta = b*b - 4*a*c
    -- bla bla
    in case delta `compare` 0


-- Tryb wyliczeniowy
data Mob = Chicken
        | Cow
        | Horse
        | Pig 
        | Sheep
        | Villager 
        | Skeleton
        | Creeeper
        | Zombie
        deriving Show

-- Dopasowanie wzorca
isHostile Zombie = True
isHostile Skeleton = True
isHostile Creeper = True
isHostile _ = False

-- type = synonim, np. type Id = String czyli Id to to samo co String
--        używając type pozbawiamy sie tworzenie klasy, ale można zrobić new type Cos ale tylko
--        z jednym parametrem możliwym
-- data = umożliwa zrobienie wszystkiego, może być wolniejszy od type
-- do = takie rozwinięcie <<=, pozwala zrobić parę rzeczy w kolejności jaki widać
-- przypisanie takie w tym do to jest coś takiego:
main :: IO ()
main = do
    line <- getLine
    let noa = filter (/='a') line
    print noa       -- należy zakończyć tym czym się zaczęło, jak nie wyjdzie nam tak jak trzeba to 
                    -- dajemy return noa i koniec

-- QUicksort
-- qso [] = []
-- qso (x:xs) = small ++ [x] ++ big
--     where
--         small 

-- Implementacja drzew
import Control.Monad.State
import Control.Monad
import System.Random

data Atree a = ALeaf a | ANode (ATree a) (ATree a) deriving Show

-- Wstawianie elementu do drzewa
-- insertA x (ALeaf y) = ANode (ALeaf x) (ALeaf y)
-- insertA x (ANode l r) 


-- Funktory są po to żeby wprowadzić funkcję do wnętrza czegoś innego (np innej funkcji)
-- np. fmap (+1) (Just 3)
-- Definiuje się je na przykład na całe drzewo żeby coś zrobić i jest gitara

-- Stan to po prostu taka zmienna niewidzialna dostępna dla danej funckji, odczyt za pomocą
-- funkcji get a zapis za pomocą put(vartość)

-- Jak robi się za wiele elementow w funckji to lepiej zrobić abstrakcję (głównie w Monadzie)