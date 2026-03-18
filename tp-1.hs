import System.Win32 (xBUTTON1)
--Ejercicio 1
doble x = x + x
cuadruple x = 4*x

(\x -> x + 1) 3
(\x -> x * 2) 2
(doble doble) 1
doble 2 + doble 2
doble 3 - doble 1
cuadruple 1
cuadruple 2 - cuadruple 1
(\x y -> x * y) 2 2

--Ejercicio 2 
-- doble (doble 2)
-- doble 2 + doble 2
-- (2 + 2) + doble 2
-- (2 + 2) + (2 + 2)
-- 4 + 4
-- 8

--Ejercicio 3
-- cuadruple 2
-- 4 * 2
-- 8

-- cuadruple (cuadruple 2) -> esta puede resolverse de forma externa e interna
-- cuadruple (4 * 2)
-- cuadruple 8
-- 4 * 8
-- 32

--Ejercicio 4
triple x = x * 3
succ x = x + 1
sumarDos x = x + 2

--Ejercicio 5
-- suponiendo que
--  twice f = \x -> f (f x)
--  succ x = x + 1
--  sumarDos x = x + 2
-- entonces :
--  twice succ = sumarDos
--  \x -> succ (succ x) = x + 2
--  \x -> succ (x + 1) = x + 2
--  \x -> x + (x + 1) = x + 2
--  \x -> x + 2 = x + 2

--Ejercicio 6
-- 3 + 3 = 6
-- 5 = 3 + 2
-- 3 = (\x -> x + 2) 1

--Ejercicio 7
-- ((twice twice) doble) 3
-- (twice (twice doble)) 3
-- (twice doble (twice doble) 3)
-- (twice doble (doble (doble 3))
-- (twice doble (doble (2 * 3))
-- (twice doble (doble 6))
-- (twice doble (2 * 6))
-- (twice doble) 12
-- doble (doble 12)
-- doble (2 * 12)
-- doble 24
-- 2 * 24
-- 48

--Ejercicio 8
-- triple = (\x -> x * 3)
-- succ = (\x -> x + 1)
-- sumarDos = (\x -> x + 2)
-- twice = (\f -> \x -> f (f x))
-- twice twice = (\x -> (\f -> \y -> f (f y)) ((\f -> \y -> f (f y)) x))  

--Ejercicio 9
f x = let (y,z) = (x,x) in y
--
f x = x

f (x,y) = let z = x + y in g (z,y) where g (a,b) = a - b
--
f (x,y) = (x + y) - y

f p = case p of (x,y) -> x
--
f (x,_) = x

f = \p -> let (x,y) = p in y
--
f (_,y) = y