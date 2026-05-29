-- Definiciones de tipos [2, 4]
data N = Z | S N deriving (Show, Eq)
data DigBin = O | I deriving (Show, Eq)
type NBin = [DigBin]
type NU = [()]

-----------------------------------------------------------
-- i) Funciones para N (Unario Algebraico) [1, 2]
-----------------------------------------------------------
evalN :: N -> Int
evalN Z     = 0
evalN (S n) = 1 + evalN n

succN :: N -> N
succN n = S n

addN :: N -> N -> N
addN Z     m = m
addN (S n) m = S (addN n m)

-- Necesaria para nb2n
prodN :: N -> N -> N
prodN Z     m = Z
prodN (S n) m = addN m (prodN n m)

-----------------------------------------------------------
-- ii) Conversiones entre representaciones [4, 5]
-----------------------------------------------------------
nu2n :: NU -> N
nu2n []     = Z
nu2n (_:xs) = S (nu2n xs)

n2nu :: N -> NU
n2nu Z     = []
n2nu (S n) = () : n2nu n

-----------------------------------------------------------
-- iii) Funciones para NBin (Binario) [6-8]
-----------------------------------------------------------
evalNB :: NBin -> Int
evalNB []     = 0
evalNB (d:ds) = dbAsInt d + 2 * evalNB ds

dbAsInt :: DigBin -> Int
dbAsInt O = 0
dbAsInt I = 1

normalizarNB :: NBin -> NBin
normalizarNB [] = []
normalizarNB (d:ds) = aux d (normalizarNB ds)

aux :: DigBin -> NBin -> NBin
aux O [] = []
aux b ds = b:ds

succNB :: NBin -> NBin
succNB []     = [I]
succNB (O:ds) = I : ds
succNB (I:ds) = O : succNB ds

addNB :: NBin -> NBin -> NBin
addNB ds1 ds2 = addNBConCarry ds1 ds2 O

addNBConCarry :: NBin -> NBin -> DigBin -> NBin
addNBConCarry []  ds2 O = ds2 
addNBConCarry []  ds2 I = succNB ds2 
addNBConCarry ds1 []  O = ds1 
addNBConCarry ds1 []  I = succNB ds1 
addNBConCarry (d1:ds1) (d2:ds2) c = 
    combinarResultados (addDB d1 d2 c) ds1 ds2 

combinarResultados :: (DigBin, DigBin) -> NBin -> NBin -> NBin
combinarResultados (resBit, carryOut) ds1 ds2 = 
    resBit : addNBConCarry ds1 ds2 carryOut 

addDB :: DigBin -> DigBin -> DigBin -> (DigBin, DigBin)
addDB O O O = (O, O) 
addDB O O I = (I, O) 
addDB O I O = (I, O) 
addDB O I I = (O, I) 
addDB I O O = (I, O) 
addDB I O I = (O, I) 
addDB I I O = (O, I) 
addDB I I I = (I, I) 

-----------------------------------------------------------
-- iv) Puentes Binario -> Unario [8]
-----------------------------------------------------------
nb2n :: NBin -> N
nb2n []     = Z
nb2n (d:ds) = addN (dbAsN d) (prodN (S (S Z)) (nb2n ds)) 

dbAsN :: DigBin -> N 
dbAsN O = Z
dbAsN I = S Z

n2nb :: N -> NBin
n2nb Z     = []
n2nb (S n) = succNB (n2nb n)