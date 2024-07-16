myMap :: (a -> b) -> [a] -> [b] 
myMap f x = [f xs | xs <- x]

myFilter :: (a -> Bool) -> [a] -> [a] 
myFilter f a = [x | x <- a, f x]

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f xs ys = [f x y | (x, y) <- zip xs ys]

thingify :: [Int] -> [Int] -> [(Int, Int)]
thingify xs ys = [(x, y) | x <- xs, y <- ys, x `mod` y == 0]

factors :: Int -> [Int] 
factors x  = [xs | xs <- [1..x], x `mod` xs == 0]
