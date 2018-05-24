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

-- Functions to operate on lists
--    head - returns first element
--    tail - returns list without first element
--    last - returns last element of list
--    init - returns list without last element
--    length - returns length of the list 
--    null - checks if list is empty
--    reverse - returns list in reversed order
--    take x y - takes x first elements of list and returns them
--    drop x y - returns elements of y list with index bigger or equal of x
--    maximum/minimum - returns biggest/smallest element form list
--    sum, product - makes sum/product of elements of the list
--    elem - checks if element is in list (eg. 4 `elem` [1,2,3] => False)

makeListInRange x y =
    [x..y]

makeListStepTwo x y =
    [x,x+2..y]

takeElementsOfSmallList num list =
    take num (cycle list)

takeElementsOfRepeatingLists num element = 
    take num (repeat element)

replicateElementAsList count element =
    replicate count element

getEvenNumbersFromRange first last =
    [x*2 | x <- [first..last]]

getEvenNumbersFromRangeBiggerThanElement first last element =
    [x*2 | x <- [first..last], x*2 >= element]

filterList list =
    [if x /= "SPAM" then x else "" | x <- list]

-- List comprahesions has a structure as:
-- [function | predicate of argument for that function, another one, etc.]
-- eg. [adjective ++ " " ++ noun | adjective <- param1, noun <- param2]

-- We can set variable in memory in interpreter via writing
-- let variable = value
-- then it is possible to work with that variable

-- _ means it can be anything and we won't use it
length' xs = sum [1 | _ <- xs]

removeNonUpperCase string =
    [c | c <- string, c `elem` ['A'..'Z']]

removeNonLowerCase string =
    [c | c <- string, c `elem` ['a'..'z']]

removeOddNumbers xxs =
    [ [x | x <- xs, even x] | xs <- xxs ]

-- Tuples:
--      fst (x,y) - returns x (only for pairs)
--      snd (x,y) - returns y (only for pairs)
--      zip x y - gets list x and y and makes list of tuples as: [(x[0], y[0]), (x[1], y[1]), ...]
--      example:
enumerateListToTuple list =
    zip [1..] list

rightTriangles maxLength =
    [(a,b,c) | c <- [1..maxLength], a <- [1..c], b <- [1..c], a^2 + b^2 == c^2]