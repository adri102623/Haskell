--    P48366   Haskell - Parcial 2017-12-04

eval1 :: String -> Int
eval1 s = eval1Aux [] $ words s
    where
       eval1Aux :: [Int] -> [String] -> Int
       eval1Aux [x] [] = x
       eval1Aux (x1:x2:stack) ("+":t) = eval1Aux ((x2+x1):stack) t
       eval1Aux (x1:x2:stack) ("-":t) = eval1Aux ((x2-x1):stack) t
       eval1Aux (x1:x2:stack) ("/":t) = eval1Aux ((div x2 x1):stack) t
       eval1Aux (x1:x2:stack) ("*":t) = eval1Aux ((x2*x1):stack) t
       eval1Aux stack (n:t) = eval1Aux ((read n):stack) t

eval2 :: String -> Int
eval2 s = head $ foldl eval2Aux [] $ words s
    where
        eval2Aux :: [Int] -> String -> [Int]
        eval2Aux (x1:x2:stack) "+" = ((x2+x1):stack)
        eval2Aux (x1:x2:stack) "-" = ((x2-x1):stack)
        eval2Aux (x1:x2:stack) "/" = ((div x2 x1):stack)
        eval2Aux (x1:x2:stack) "*" = ((x2*x1):stack)
        eval2Aux stack n = ((read n):stack)

fsmap :: a -> [a -> a] -> a
fsmap x lf = foldl (\x f -> f x) x lf


divideNconquer :: (a -> Maybe b) -> (a -> (a, a)) -> (a -> (a, a) -> (b, b) -> b) -> a -> b
divideNconquer base divide conquer x
    | trivial (base x) = extract $ base x
    | otherwise = conquer x (l,r) (l',r')
        where
            trivial :: (Maybe b) -> Bool
            trivial Nothing = False
            trivial _ = True

            extract :: (Maybe b) -> b
            extract (Just x) = x

            (l,r) = (divide x)
            l' = divideNconquer base divide conquer l
            r' = divideNconquer base divide conquer r


quickSort :: [Int] -> [Int]
quickSort l = divideNconquer base divide conquer l
    where
        base :: [Int] -> Maybe [Int]
        base [] = (Just [])
        base [x] = (Just [x])
        base _ = Nothing

        divide :: [Int] -> ([Int],[Int])
        divide (x:xs) = (lower, higher)
            where
                lower = [y | y <- xs, y <= x]
                higher = [y | y <- xs, y > x]

        conquer :: [Int] -> ([Int],[Int]) -> ([Int],[Int]) -> [Int]
        conquer (x:_) _ (l,r) = l ++ [x] ++ r


data Racional = Racional Integer Integer

instance Show Racional where
    show (Racional n d) = (show n) ++ "/" ++ (show d)

instance Eq Racional where
    (Racional n1 d1) == (Racional n2 d2) = n1 * d2 == n2 * d1

racional :: Integer -> Integer -> Racional
racional n d = (Racional (div n g) (div d g))
    where
        g = gcd n d

numerador :: Racional -> Integer
numerador (Racional n d) = n

denominador :: Racional -> Integer
denominador (Racional n d) = d

data Tree a = Node a (Tree a) (Tree a)

recXnivells :: Tree a -> [a]
recXnivells t = recXnivells' [t]
    where recXnivells' ((Node x fe fd):ts) = x:recXnivells' (ts ++ [fe, fd])

racionals :: [Racional]
racionals = recXnivells $ calkinwilf $ racional 1 1

calkinwilf :: Racional -> Tree Racional
calkinwilf (Racional a b) = (Node (Racional a b) (calkinwilf (Racional a (a+b))) (calkinwilf (Racional (a+b) b)))








