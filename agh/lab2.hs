-- Examples
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

sign x  | x > 0 = 1
        | x == 0 = 0
        | x < 0 = -1

sum2a m n =
    m + n

sum2b (m:n:_) = m + n

-- Implementation of zip function (stack overflow)
my_zip :: [a] -> [b] -> [(a,b)]
my_zip (a:list1) (b:list2) =
    (a, b) : my_zip list1 list2
my_zip _ _ = []

-- Function returns amount of bacteria A and B at specific point of time
-- Returned value: (A-bacteria-number, B-bacteria-number)
-- Bacteria A after 1s -> 2x bact. B
-- bacteria B after -> bact. A + bact. B
bacteria :: Int -> (Int, Int)
bacteria 0 = (1,0)
bacteria time = 
   (snd (bacteria (time-1)), (((fst (bacteria (time-1)))*2) + (snd (bacteria (time-1)))))

-- Bacteria function with initial of 2 A-bacteries
bac_2 :: Int -> (Int, Int)
bac_2 0 = (2, 0)
bac_2 time = 
    (snd (bac_2 (time-1)), (((fst (bac_2 (time-1)))*2) + (snd (bac_2 (time-1)))))
 
-- Function splits number into list of digits
split_num :: Int -> [Int]
split_num 0 = []
split_num liczba =
    liczba `mod` 10 : split_num (liczba `div` 10)

-- Function creates supernumber (if number is single digit, return digit,
-- call supercyfry with paramter equal of sum of digits of number
supercyfry :: Int -> Int
supercyfry x    | x < 10 = x
                | x >= 10 = supercyfry (sum (split_num x))

-- Function deletes repeating elements from list
delete_dup :: Eq a => [a] -> [a]
delete_dup [] = []
delete_dup (x:list) =
    if elem x list == True then delete_dup list else x : delete_dup list

-- Function returns list of elements that are repeated in list at least 
-- given times
-- at_least :: Eq a => ([a], Int) -> [a]
at_least (x:list, n) =
    filter (\a -> length a >= n) (x : (filter (==x) list))
    