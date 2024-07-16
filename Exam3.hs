import Data.List (sort)

ocurrencies :: String -> [(String, Int)]
ocurrencies text = ocurrencies' (words text) []
  where 
    ocurrencies' :: [String] -> [(String, Int)] -> [(String, Int)] 
    ocurrencies' [] acc = acc
    ocurrencies' (x:xs) acc = ocurrencies' xs (incOrPush x acc)

    incOrPush :: String -> [(String, Int)] -> [(String, Int)]
    incOrPush word [] = [(word, 1)]
    incOrPush word ((w, count):rest)
      | word == w = (w, count + 1) : rest
      | otherwise = (w, count) : incOrPush word rest

imprimirOcurrencias :: [(String, Int)] -> IO ()
imprimirOcurrencias lista = sequence_ $ map imprimir lista
    where imprimir (palabra, num) = putStrLn $ palabra ++ " " ++ show num

main :: IO ()
main = do
    text <- getContents
    let ocurrencias = sort $ ocurrencies text
    imprimirOcurrencias ocurrencias
