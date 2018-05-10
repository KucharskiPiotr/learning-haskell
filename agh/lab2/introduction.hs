fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

sign x  | x > 0 = 1
        | x == 0 = 0
        | x < 0 = -1

sum2a m n =
    m + n

my_zip list1 list2 =
    [(head list1, y) | y <- list2]
