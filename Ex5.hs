data Expr = Val Int 
    | Add Expr Expr 
    | Sub Expr Expr 
    | Mul Expr Expr 
    | Div Expr Expr

eval1 :: Expr -> Int 
eval1 (Val  x) = x
eval1 (Add x1 x2) = (eval1 x1) + (eval1 x2)
eval1 (Sub x1 x2) = (eval1 x1) - (eval1 x2)
eval1 (Mul x1 x2) = (eval1 x1) * (eval1 x2)
eval1 (Div x1 x2) = div (eval1 x1) (eval1 x2)

eval2 :: Expr -> Maybe Int 

eval2 (Val  x) = Just x
eval2 (Add x1 x2) = eval2aux x1 x2 (+)
eval2 (Sub x1 x2) = eval2aux x1 x2 (-)
eval2 (Mul x1 x2) = eval2aux x1 x2 (*)
eval2 (Div x1 x2)
    | eval2 x2 == (Just 0) = Nothing
    | otherwise = eval2aux x1 x2 div

eval2aux :: Expr -> Expr -> (Int -> Int -> Int) -> Maybe Int
eval2aux e1 e2 op = do
    v1 <- eval2 e1
    v2 <- eval2 e2
    return $ op v1 v2


eval3 :: Expr -> Either String Int 
eval3 (Val  x) = Right x
eval3 (Add x1 x2) = eval3aux x1 x2 (+)
eval3 (Sub x1 x2) = eval3aux x1 x2 (-)
eval3 (Mul x1 x2) = eval3aux x1 x2 (*)
eval3 (Div x1 x2)
    | eval3 x2 == (Right 0) = Left "div0"
    | otherwise = eval3aux x1 x2 div

eval3aux :: Expr -> Expr -> (Int -> Int -> Int) -> Either String Int
eval3aux e1 e2 op = do
    v1 <- eval3 e1
    v2 <- eval3 e2
    return $ op v1 v2