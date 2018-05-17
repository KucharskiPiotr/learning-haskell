
policzISumuj :: (Int -> Int) -> Int -> Int -> Int
policzISumuj f x y =
    sum (map f [x..y])

pierwsze :: [Int] -> [Int]
pierwsze a =
    filter (\x -> null [i | i <- [2..x-1], x `mod` i == 0]) a

conajmniejn :: [Int] -> Int -> [Int]
conajmniejn [] _ = []
conajmniejn [x:list] n =
    (filter (\i -> (length [a | a <- list, a == x]) >= n) list)