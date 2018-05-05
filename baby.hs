doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = 
    if x > 100
    then x
    else doubleMe x

doubleSmallNumber' x = 
    (if x > 100 then x else doubleMe x) + 1

mergeLists list1 list2 =
    list1 ++ list2

putElementOnHead element list =
    element:list

-- Funkcje jako operacje na listach
--    head - zwraca pierwszy element
--    tail - zwraca wszstko procz pierwszego
--    last - zwraca ostatni element
--    init - zwraca wszystko procz ostatniego
--    length - zwraca dlugosc listy
--    null - sprawdza czy lista jest pusta
--    reverse - odwraca liste
--    take x y - bierze x poczatkowych elementow listy y i zwraca je
--    drop x y - zwraca elementy listy y o indeksach powyzej x wlacznie
--    maximum/minimum - zwraca max/min z listy
--    sum, product - operacje dodawania/mnozenia elementow calej listy
--    elem - sprawdza czy element nalezy do listy (np. 4 `elem` [1,2,3] => False)

makeListInRange x y =
    [x..y]

makeListStepTwo x y =
    [x,x+2..y]

