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
