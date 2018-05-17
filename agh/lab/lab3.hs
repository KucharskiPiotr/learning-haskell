
-- Zadanie 4
policzISumuj :: (Int -> Int) -> Int -> Int -> Int
policzISumuj f x y =
    sum (map f [x..y])

-- Zadanie 5
pierwsze :: [Int] -> [Int]
pierwsze a =
    filter (\x -> null [i | i <- [2..x-1], x `mod` i == 0]) a

-- Zadanie 6
conajmniejn :: [Int] -> Int -> [Int]
conajmniejn [] _ = []
conajmniejn (x:list) n  | (length [y | y <- list, y == x]) >= (n-1) = 
    if (x `elem` (conajmniejn list n))
    then (conajmniejn list n)
    else (x : (conajmniejn list n))
                        | otherwise = conajmniejn list n