fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

sign x  | x > 0 = 1
        | x == 0 = 0
        | x < 0 = -1

sum2a m n =
    m + n

sum2b (m:n:_) = m + n

my_zip :: [a] -> [b] -> [(a,b)]
my_zip (a:list1) (b:list2) =
    (a, b) : my_zip list1 list2
my_zip _ _ = []


-- Bacteria A after 1s -> 2x bact. B
-- bacteria B after -> bact. A + bact. B
bacteria :: Int -> (Int, Int)
bacteria 0 = (1,0)
bacteria time = 
   (snd (bacteria (time-1)), (((fst (bacteria (time-1)))*2) + (snd (bacteria (time-1)))))