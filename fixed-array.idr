module Main
 
||| A fun experiment to try to implement vectors that would correspond to a fixed
||| size in underlying memory. Similar to the capacity of Go slices.
 
taken : Nat -> Nat -> Nat -> Nat
taken n max = (\v => if v+n > max then max + 8 else max)
 
data Fmv : (c : Nat) -> (m : Nat) -> (Nat -> Nat) -> Type -> Type where
  fwv : (Vect c t) -> (m : Nat) -> Fmv c m (taken c m) t

Fmv' : Nat -> Nat -> Type -> Type
Fmv' c m t = Fmv c m (taken c m) t

safeAppend : Fmv c m f t -> Fmv c' (f c') f' t -> Fmv (c + c') m (taken (c + c') m) t
safeAppend (fwv v max) (fwv v' _) = fwv (v ++ v') max

tiny : Vect 3 Int
tiny = [1,2,3]
 
lil : Vect 3 Int
lil = [4,5,6]
 
tinyf : Fmv' 3 16 Int
tinyf = fwv tiny 16
 
lilf : Fmv' 3 16 Int
lilf = fwv lil 16
 
fat : Vect 15 Int
fat = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
 
fatf : Fmv' 15 24 Int
fatf = fwv fat 24
 
||| safeAppend tinyf lilf will check
||| safeAppend tinyf fatf will not
||| Woot
 
main : IO ()
main = do print "woot"
