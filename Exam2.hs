
operacions :: String -> Either String Int
operacions text = operacions' [] $ words text
    where
        operacions' :: [Int] -> [String] -> Either String Int
        operacions' [r] [] = Right r
        operacions' (x1:x2:pila) ("+":xs) = operacions' ((x1+x2):pila) xs
        operacions' (x1:x2:pila) ("-":xs) 
            | (x2-x1) < 0 = Left "neg"
            | otherwise =  operacions' ((x2-x1):pila) xs
        operacions' (x1:x2:pila) ("*":xs) = operacions' ((x1*x2):pila) xs
        operacions' (x1:x2:pila) ("/":xs)
            | x1 == 0 = Left "div0"
            | mod x2 x1 == 0 = operacions' ((div x2 x1):pila) xs
            | otherwise = Left "divE"
        operacions' pila (x:xs) = operacions' ((read x):pila) xs

printResultat :: Either String Int -> IO()
printResultat (Right x) = putStrLn $ "Right" ++ " " ++ (show x) 
printResultat (Left x) = putStrLn $ "Left" ++ " " ++ "\"" ++ x ++ "\""

main :: IO()
main = do
    input <- getContents
    let lineas = lines input
    let resultat = map operacions lineas
    mapM_ printResultat resultat


