# Haskell

## Ex1
En aquest problema heu d’implementar una sèrie de funcions en Haskell. No cal que pregunteu si podeu fer servir funcions auxiliars, és evident que sí.
Feu una funció absValue :: Int -> Int que, donat un enter, retorni el seu valor absolut.
Feu una funció power :: Int -> Int -> Int que, donats un enter x i un natural p, retorni x elevat a p, és a dir, xp.
Feu una funció isPrime :: Int -> Bool que, donat un natural, indiqui si aquest és primer o no.
Feu una funció slowFib :: Int -> Int que retorni l’n-èsim element de la sèrie de Fibonacci tot utilitzant l’algorisme recursiu que la defineix (f(0)=0, f(1)=1, f(n)=f(n−1)+f(n−2) per n≥ 2).

## Ex2
Feu les funcions següents utilitzant funcions d’ordre superior (i altres funcions predefinides) de Haskell i sense utilitzar recursivitat.
Feu una funció eql :: [Int] -> [Int] -> Bool que indiqui si dues llistes d’enters són iguals.
Feu una funció prod :: [Int] -> Int que calculi el producte dels elements d’una llista d’enters.
Feu una funció prodOfEvens :: [Int] -> Int que multiplica tots el nombres parells d’una llista d’enters.
Feu una funció powersOf2 :: [Int] que generi la llista de totes les potències de ‍2.
Feu una funció scalarProduct :: [Float] -> [Float] -> Float que calculi el producte escalar de dues llistes de reals de la mateixa mida.

## Ex3
En aquest problema heu d’implementar una sèrie de funcions usant llistes per comprensió.
Feu una funció myMap :: (a -> b) -> [a] -> [b] que emuli el map usant llistes per comprensió.
Feu una funció myFilter :: (a -> Bool) -> [a] -> [a] que emuli el filter usant llistes per comprensió.
Feu una funció myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c] que que emuli el zipWith usant llistes per comprensió i zip.
Feu una funció thingify :: [Int] -> [Int] -> [(Int, Int)] que, donades dues llistes d’enters, genera la llista que aparella els elements si l’element de la segona llista divideix al de la primera.
Feu una funció factors :: Int -> [Int] que, donat un natural no nul, genera la llista ordenada amb els seus factors (no necessàriament primers).

## Ex4
On occasion you meet a developer who seems like a solid programmer. They know their theory, they know their language. They can have a reasonable conversation about programming. But once it comes down to actually producing code they just don’t seem to be able to do it well.
After a fair bit of trial and error I’ve discovered that people who struggle to code don’t just struggle on big problems, or even smallish problems (i.e. write a implementation of a linked list). They struggle with tiny problems. So I set out to develop questions that can identify this kind of developer and came up with a class of questions I call “FizzBuzz Questions” named after a game children often play (or are made to play) in schools in the UK. An example of a Fizz-Buzz question is the following:
Write a program that prints the numbers from 0 to 100, but: For multiples of three print ‘Fizz’ instead of the number, and for the multiples of five print ‘Buzz’. For numbers which are multiples of both three and five print ‘FizzBuzz’. 
Most good programmers should be able to write out on paper a program which does this in a under a couple of minutes. Want to know something scary? The majority of comp sci graduates can’t. I’ve also seen self- proclaimed senior programmers take more than 10-15 minutes to write a solution.

## Ex5
Es vol tenir un mòdul per a manipular i avaluar expressions d’enters amb operacions de suma, resta, multiplicació i divisió. Per això, es defineix el tipus següent:
    data Expr = Val Int | Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Div Expr Expr

Per exemple, Add (Val 3) (Div (Val 4) (Val 2)) representa 3 + 4 / 2, que s’avalua a 5.
1. Avaluació sense errors (20 punts)

Utilitzant el tipus Expr, definiu una operació eval1 :: Expr -> Int que, donada una expressió, en retorni la seva avaluació. Podeu suposar que mai hi haurà divisions per zero.
2. Avaluació amb indicació d’error (30 punts)

Utilitzant el tipus Expr, definiu una operació eval2 :: Expr -> Maybe Int que, donada una expressió, en retorni la seva avaluació com un valor Just. En el cas que es produeixi una divisió per zero, el resultat ha de ser Nothing. Segurament voleu usar la notació do sobre la mònada Maybe a.
3. Avaluació amb text d’error (30 punts)

Utilitzant el tipus Expr, definiu una operació eval3 :: Expr -> Either String Int que, donada una expressió, en retorni la seva avaluació com un valor Right. En el cas que es produeixi una divisió per zero, el resultat ha de ser Left "div0" per indicar l’error en qüestió. Segurament voleu usar la notació do sobre la mònada Either a b.

## Ex6
L’Índex de massa corporal (IMC) és un nombre que permet avaluar la corpulència d’una persona tot relacionant la seva massa amb la seva talla. Va ser desenvolupat pel belga Adolphe Quételet mentre elaborava el seu sistema de “física social" entre els anys 1830 i 1850 i també es coneix com a Índex de Quételet. La seva fórmula és IMC = 	m/h^2,
on m és la massa de la persona (en quilograms) i h la seva alçària (en metres).

La seva interpretació (aplicable només a persones adultes) és la següent:
IMC	Interpretació
menys de 18	magror
18 a 25	corpulència normal
25 a 30	sobrepès
30 a 40	obesitat
més de 40	obesitat mòrbida

Feu un programa Haskell per interpretar l’índex de massa corporal de diferentes persones.

Entrada:
L’entrada es troba organitzada per línies. A cada línia hi ha tres elements separats per blancs: nom, pès i alçaria. La darrera línia és especial i només conté un asterisc.

Sortida:
Per a cada dada de l’entrada, escriviu el seu nom i la interpretació del seu IMC.

Observació:
Per resoldre aquest problema en Haskell, feu una funció main i escolliu el compilador GHC.

## Exam1
Problema 1: Expressió postfixa 1

Escriviu una funció eval1 :: String -> Int que avalui una expressió postfixa que es troba en una string. Els elements en l’expressió són valors (nombres naturals) i els operadors de suma, resta, producte i divisió. Els elements es separen per espais. Per exemple, l’avaluació de "15 1 2 + 24 * + 3 -" és 84.

La solució canònica per evaluar expressions postfixes és utilitzar una pila: Començant per una pila buida, es processen els elements de l’expressió d’esquerra a dreta. Si l’element és un valor, s’empila. Si l’element és un operador, es desempilen dos valors, s’operen d’acord amb l’operador i s’empila el resultat. Al final, la pila conté un sol element, que és el resultat de l’evalaució de l’expressió.

Podeu suposar que no hi ha mai errors a l’expressió ni divisions per zero.

Solucioneu el problema recursivament. La funció words us pot ser útil.
Problema 2: Expressió postfixa 2

Escriviu una funció eval2 :: String -> Int que avalui una expressió postfixa com al Problema ‍1, però sense utilitzar recursivitat.
Problema 3: fsmap

Definiu una funció fsmap :: a -> [a -> a] -> a que, donats un element x de tipus a i una llista fs de funcions de tipus a -> a, fa que fsmap x fs retorni l’aplicació (d’esquerra a dreta) de totes les funcions de fs a x. Es valorà com de succinta és la vostra solució.
Problema 4: Dividir i vèncer

Escriviu una funció d’ordre superior que definixi l’esquema de dividir i vèncer i utilitzeu-la per fer l’algorisme de quicksort per a llistes d’enters.

La funció per dividir i vèncer ha de tenir aquesta interfície:
    divideNconquer :: (a -> Maybe b) -> (a -> (a, a)) -> (a -> (a, a) -> (b, b) -> b) -> a -> b

on a és el tipus del problema, b és el tipus de la solució, i divideNconquer base divide conquer x utilitza:
base :: (a -> Maybe b) per obtenir la solució directa per a un problema si és trivial (quan és un Just b) o per indicar que no és trivial (quan és Nothing).
divide :: (a -> (a, a)) per dividir un problema no trivial en un parell de subproblemes més petits.
conquer :: (a -> (a, a) -> (b, b) -> b) per, donat un problema no trivial, els seus subproblemes i les seves respectives subsolucions, obtenir la solució al problema original.
x :: a denota el problema a solucionar.

La funció pel quicksort ha de ser quickSort :: [Int] -> [Int] i ha d’utilitzar divideNconquer.
Problema 5: Racionals

Definiu un tipus Racional per manipular nombres racionals positius amb operacions per:

construir un racional a través d’un numerador i d’un denominador naturals, obtenir el numerador de la seva forma simplificada, obtenir el denominador de la seva forma simplificada.

A més, feu que Racional pertanyi a la classe Eq i a la classe Show, fent que els racionals es mostrin de la forma "x/y".

Seguiu aquesta interfície:
    data Racional = ...
    racional :: Integer -> Integer -> Racional
    numerador :: Racional -> Integer
    denominador :: Racional -> Integer

Si voleu, podeu utilitzar la funció estàndard gcd que retorna el màxim comú divisor de dos naturals.
Problema 6: Arbre de Calkin-Wilf

L’arbre de Calkin–Wilf és un arbre binari que representa tots els racionals positius. L’arbre té com arrel el racional 1/1 i, qualsevol node a/b té dos fills a/(a + b) i (a + b)/b.

Escriviu una funció racionals :: [Racional] que retorni la llista infinita de tots els nombres racionals positius segons l’ordre de l’arbre de Calkin–Wilf.

Per a fer-ho, utilitzeu el tipus Racional del problema anterior. També podeu aprofitar les definicions genèriques d’arbre infinit i del seu recorregut per nivells que es donen a continuació:
    data Tree a = Node a (Tree a) (Tree a)
    recXnivells :: Tree a -> [a]
    recXnivells t = recXnivells' [t]
        where recXnivells' ((Node x fe fd):ts) = x:recXnivells' (ts ++ [fe, fd])

## Exam2
Escriviu un programa en Haskell que avalui expressions escrites en notació postfixa sota la presència de possibles errors.

Cada expressió es troba escrita en una línia i és sintàcticament correcta. Una expressió està formada per una seqüència de paraules que poden ser nombres naturals o operadors de suma, resta, producte i divisió.

El resultat d’una expressió és de tipus Either String Int i es correspon a un resultat natural o bé un error: Els nombres negatius resultants de restes porten a l’error "neg", la divisió per zero porta a l’error "div0" i els nombres no naturals resultants de divisions porten a "divE". En el cas d’haver-hi més d’un error en una expressió, cal reportar el de més a l’esquerra.

## Exam3
Feu un programa en Haskell que llegeixi un text i escrigui quants cops apareix cada paraula del text, en ordre alfabètic.

Entrada:
L’entrada és una seqüència de paraules, totes formades per lletres minúscules.

Sortida:
Per a cada paraula de l’entrada, en ordre alfabètic, cal escriure la paraula seguida del seu nombre d’aparicions al text.

Observació:
El vostre programa ha de ser eficient i no pot utilitzar recursivitat. Podeu usar la funció sort que ordena llistes eficientment fent un import Data.List (sort) al principi del vostre programa. També us pot ser útil la funció words.
