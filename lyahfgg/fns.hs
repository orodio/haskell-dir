lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're our of luck, pal!"

sayMe :: Int -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectors' :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

fst' :: (a, b, c) -> a
fst' (x, _, _) = x

snd' :: (a, b, c) -> b
snd' (_, x, _) = x

trd' :: (a, b, c) -> c
trd' (_, _, x) = x

head' :: [a] -> a
head' [] = error "Cant call head on a empty list, dummy!"
head' (x:_) = x

head'' :: [a] -> a
head'' xs = case xs of []    -> error "No head for empty lists!"
                       (x:_) -> x

tell :: (Show a) => [a] -> String
tell []       = "The list is empty"
tell (x:[])   = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_)  = "The list is long. the first two elements are: " ++ show x ++ " and " ++ show y

firstLetter :: String -> String
firstLetter ""         = "Empty String, whoops!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

bmiTell :: Double -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congrats!!"

bmiTell' :: Double -> Double -> String
bmiTell' weight height
    | weight / height ^ 2 <= 18.5 = "Under"
    | weight / height ^ 2 <= 25.0 = "Normal"
    | weight / height ^ 2 <= 30.0 = "Fat"
    | otherwise                   = "Whale"

bmiTell'' :: Double -> Double -> String
bmiTell'' weight height
    | bmi <= 18.5 = "Under"
    | bmi <= 25.0 = "Normal"
    | bmi <= 30.0 = "Fat"
    | otherwise   = "Whale"
    where bmi = weight / height ^ 2

bmiTell''' :: Double -> Double -> String
bmiTell''' weight height
    | bmi <= skinny = "Under"
    | bmi <= normal = "Normal"
    | bmi <= fat    = "Fat"
    | otherwise     = "Whale"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat    = 30.0

bmiTell'''' :: Double -> Double -> String
bmiTell'''' weight height
    | bmi <= skinny = "Under"
    | bmi <= normal = "Normal"
    | bmi <= fat    = "Fat"
    | otherwise     = "Whale"
    where bmi                   = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)

max' :: (Ord a) => a -> a -> a
max' a b
    | a <= b    = b
    | otherwise = a

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a == b    = EQ
    | a <= b    = LT
    | otherwise = GT

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

cylinder :: Double -> Double -> Double
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea  = pi * r ^ 2
  in sideArea + (topArea * 2)

letA = 4 * (let a = 9 in a + 1) + 2 -- 42
letB = [let square x = x * x in (square 5, square 3, square 2)] -- [(25,9,4)]
letC = (let a = 100; b = 200; c= 300 in a*b*c, let foo="Hey "; bar="there!" in foo ++ bar) -- (6000000, "Hey there!")
letD = (let (a,b,c) = (1,2,3) in a+b+c) * 100 -- 600

calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi | (w,h) <- xs, let bmi = w / h ^ 2]

describeList :: [a] -> String
describeList ls = "The list is " ++ case ls of []  -> "empty."
                                               [x] -> "a singleton list."
                                               xs  -> "a longer list."

describeList' :: [a] -> String
describeList' ls = "The list is " ++ what ls ++ "."
    where what []  = "empty"
          what [x] = "a singleton list"
          what xs  = "a longer list"

maximum' :: (Ord a) => [a] -> a
maximum' []     = error "Maximum of empty list!"
maximum' [x]    = x
maximum' (x:xs) = max x (maximum' xs)

maximum'' :: (Ord a) => [a] -> a
maximum'' = foldl1 max

replicate' :: Int -> a -> [a]
replicate' n x
    | n <= 0    = []
    | otherwise = x : replicate' (n - 1) x

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0 = []
take' _ []   = []
take' n (x:xs) = x : take' (n - 1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

reverse'' :: [a] -> [a]
reverse'' = foldl (\acc x -> x : acc) []

reverse''' :: [a] -> [a]
reverse''' = foldl (flip (:)) []

repeat' :: a -> [a]
repeat' x = x:repeat' x

zip' :: [a] -> [b] -> [(a,b)]
zip' _ []          = []
zip' [] _          = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
    | a == x    = True
    | otherwise = a `elem'` xs

elem'' :: (Eq a) => a -> [a] -> Bool
elem'' y ys = foldr (\x acc -> if x == y then True else acc) False ys

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerOrEqual = [a | a <- xs, a <= x]
        larger         = [a | a <- xs, a > x]
    in quicksort smallerOrEqual ++ [x] ++ quicksort larger

quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) =
  let smallerOrEqual = filter (<= x) xs
      larger         = filter (> x) xs
  in (quicksort' smallerOrEqual) ++ [x] ++ (quicksort' larger)

quicksort'' :: (Ord a) => [a] -> [a]
quicksort'' [] = []
quicksort'' (x:xs) = smaller ++ [x] ++ larger
    where smaller = quicksort'' (filter (<= x) xs)
          larger  = quicksort'' (filter (> x) xs)

quicksort''' :: (Ord a) => [a] -> [a]
quicksort''' [] = []
quicksort''' (x:xs) = smaller ++ [x] ++ larger
    where smaller = quicksort''' [y | y <- xs, (<= x) y]
          larger  = quicksort''' [z | z <- xs, (> x) z]

quicksort'''' :: (Ord a) => [a] -> [a]
quicksort'''' [] = []
quicksort'''' (x:xs) = smaller ++ [x] ++ larger
    where smaller = quicksort'''' $ filter (<= x) xs
          larger  = quicksort'''' $ filter (> x) xs

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map f xs

map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldr (\x acc -> f x : acc) [] xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x       = x : filter' p xs
    | otherwise = filter' p xs

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' p = foldr (\x acc -> if p x then x : acc else acc) []

chain :: Integer -> [Integer]
chain 1 = [1]
chain n
    | even n = n:chain (div n 2)
    | odd  n = n:chain (n * 3 + 1)

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0

product' :: (Num a) => [a] -> a
product' = foldl (*) 1

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

and' :: [Bool] -> Bool
and' xs = foldr (&&) True xs

wtfA = map ($ 3) [(4+)]                    -- [7]
wtfb = map ($ 3) [(4+), (10*)]             -- [7, 30]
wtfC = map ($ 3) [(4+), (10*), (^2)]       -- [7,30,9]
wtfD = map ($ 3) [(4+), (10*), (^2), sqrt] -- [7.0, 30.0, 9.0, 1.7320508075688772]
