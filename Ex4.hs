fizzBuzz :: [Either Int String]
fizzBuzz = [(fizzBuzz' x) | x <- [0..]]
    where
        fizzBuzz' x
            | null ((mod5 x)++(mod3 x)) = Left x
            | otherwise = Right ((mod3 x)++(mod5 x))
                where
                    mod5 x
                        | mod x 5 == 0 = "Buzz"
                        | otherwise = ""
                    mod3 x
                        | mod x 3 == 0 = "Fizz"
                        | otherwise = ""
