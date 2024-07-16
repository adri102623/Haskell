eql :: [Int] -> [Int] -> Bool

eql l p = if(length l /= length p) then False else and (zipWith (==) l p)

prod :: [Int] -> Int

prod l = foldl (*) 1 l

prodOfEvens :: [Int] -> Int

prodOfEvens l = foldl (*) 1 (filter even l)

powersOf2 :: [Int]

powersOf2 = iterate (*2) 1

scalarProduct :: [Float] -> [Float] -> Float

scalarProduct l p  = foldl (+) 0 (zipWith (*) l p)
