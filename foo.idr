module Main

recTest : Int -> Int
recTest = recTestHelper 1
  where
    recTestHelper : Int -> Int -> Int
    recTestHelper n 0 = n
    recTestHelper n m = recTestHelper (n * m) (m - 1)

loadRec : (Int -> Int) -> IO ()
loadRec f = mkForeign (FFun "window.recTest = %0" [FFunction FInt FInt] FUnit) f


main : IO ()
main = loadRec recTest
