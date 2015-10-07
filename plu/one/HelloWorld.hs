-- helloWorld :: IO ()
-- helloWorld = putStrLn "Hello World!"

-- introduceLine :: String -> String -> String
-- introduceLine n1 n2 = n1 ++ ", this is " ++ n2

-- introduce :: String -> String -> IO ()
-- introduce n1 n2 = do
--   putStrLn $ introduceLine n1 n2
--   putStrLn $ introduceLine n2 n1

-- main :: IO ()
-- main = do
--   putStrLn "What is the name of the person you want to introduce?"
--   person1 <- getLine
--   putStrLn $ "Who do you want to introduce " ++ person1 ++ " too?"
--   person2 <- getLine
--   introduce person1 person2

greet :: IO ()
greet = do
  putStrLn "Who are you?"
  who <- getLine
  putStrLn $ "Hello " ++ who

greetForever :: IO ()
greetForever = do
  greet
  greetForever

main :: IO ()
main = greetForever
