calculIMC :: Float -> Float -> Float
calculIMC m h = m / (h^2)

index :: Float -> String
index imc 
    | imc < 18 = "magror"
    | (imc >= 18) && (imc < 25) = "corpulencia normal"
    | (imc >= 25) && (imc < 30) = "sobrepes"
    | (imc >= 30) && (imc < 40) = "obesitat"
    | imc > 40 = "obesitat morbida"

output :: String -> String
output text = nom ++ ": " ++ index (calculIMC m h)
    where 
        nom = head $ words text
        [m , h] = map read $ tail $ words text :: [Float]

main :: IO()
main = do
    line <- getLine
    if line /= "*" then do 
        putStrLn $ output line
        main
    else 
        return()