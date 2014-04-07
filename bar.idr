module Main

myShow : (i : Integer) -> Integer -> IO ()
myShow x y = putStrLn $ show x

main : IO ()
main = myShow (i=2) 2
