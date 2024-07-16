absValue :: Int -> Int

absValue n
    | n >= 0    =  n
    | otherwise = -n

power :: Int -> Int -> Int
power x n = x^n

isPrime :: Int -> Bool
isPrime k = if k > 1 then null [ x | x <- [2..k - 1], k `mod` x == 0] else False

slowFib :: Int -> Int
slowFib x
    |x == 0 = x
    |x == 1 = x
    |otherwise = slowFib(x-1) + slowFib(x-2)

 
