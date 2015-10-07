doubleMe :: Num a => a -> a
doubleMe x = x + x

doubleUs :: Num a => a -> a -> a
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber :: (Ord a, Num a) => a -> a
doubleSmallNumber x = if x > 100 then x else doubleMe x

doubleSmallNumber' :: (Ord a, Num a) => a -> a
doubleSmallNumber' x = (doubleSmallNumber x) + 1

conanO'Brien :: [Char]
conanO'Brien = "Its's a-me, COnan O'Brien!"

--
-- Lists
--

lostNumbers = [4,8,15,16,23,42]

startNumbers = [1,2,3,4]
endNumbers = [9,10,11,12]
allNumbers = startNumbers ++ endNumbers
-- => [1,2,3,4,9,10,11,12]

hello = "hello"
world = "world"
helloWorld = hello ++ " " ++ world ++ "!"
-- => "hello world!"

woot = ['w','o'] ++ ['o','t']
-- => woot

theCharA = 'A'
smallCat = " SMALL CAT"
aSmallCat = theCharA : smallCat
-- => "A SMALL CAT"

five = 5
oneToFive = [1,2,3,4,5]
fiveAndOneToFive = five : oneToFive
-- => [5,1,2,3,4,5]

listA = 1:2:3:[]
listB = [1,2,3]
isListAEqualToListB = listA == listB
-- => True

steveBuscemi = "Steve Buscemi"
theSixCharInSteveBuscemi = steveBuscemi !! 6
-- => 'B'
-- 0 indexed

theOneNumberInStartNumbers = startNumbers !! 1
-- => 2

bigList1 = [[1,2,3,4], [5,3,3,3], [1,2,2,3,4], [1,2,3]]
bigList2 = bigList1 ++ [[1,1,1,1]]
bigList3 = [6,6,6]:bigList1

compa1 = [3,4,2] < [3,4,3] -- true  -- evaluated on last
compa2 = [3,4,5] > [3,4,6] -- false -- evaluated on last
compa3 = [3,4,2] > [3,4]   -- true  -- evaluated on second
compa4 = [3,4,2] > [2,4]   -- true  -- evaluated on last
-- an empty list is less than a list with something in it

-- listA = [1,2,3]
headOfListA    = head listA    -- 1
tailOfListA    = tail listA    -- [2,3]
lastOfListA    = last listA    -- 3
initOfListA    = init listA    -- [1,2]
lengthOfListA  = length listA  -- 3
listAIsNull    = null listA    -- False
reverseOfListA = reverse listA -- [3,2,1]

longList = [1,2,3,4,5,6,7,8,9]
firstThreeOfLongList  = take 3 longList   -- [1,2,3]
firstOneOfLongList    = take 1 longList   -- [1]
first15OfLongList     = take 15 longList  -- [1,2,3,4,5,6,7,8,9]
first0OfLongList      = take 0 longList   -- []
longListWithOutFirst3 = drop 3 longList   -- [4,5,6,7,8,9]
maxOfLongList         = maximum longList  -- 9
minOfLongList         = minimum longList  -- 1
sumOfLongList         = sum longList      -- 45
productOfLongList     = product longList  -- 362880
fiveIsInLongList      = elem 5 longList   -- True
sevenIsInLongList     = 7 `elem` longList -- True

rangeFromOneToTwenty = [1..20]
rangeOfAllTheNumbersAndLetters = ['0'..'9'] ++ ['a'..'z'] ++ ['A'..'Z']
rangeOfEvenNumbers = [2,4..20]
rangeDownwardMotion = [20,19..1]
infinateRange = [1..]
infinateEvenRange = [2,4..]

exampleOfCycle = take 10 (cycle [1,2,3]) -- [1,2,3,1,2,3,1,2,3,1]
exampleOfCycle2 = take 12 (cycle "LOL ") -- "LOL LOL LOL "
exampleOfRepeat = take 10 (repeat 5)     -- [5,5,5,5,5,5,5,5,5,5]
exampleOfReplicate = replicate 3 10      -- [10,10,10]

--
-- List Comprehension
--

compA = [x*2 | x <- [1..10]]                 -- [2,4,6,8,10,12,14,16,18,20]
compB = [x*2 | x <- [1..10], x*2 >= 12]      -- [12,14,16,18,20]
-- All numbers from 50 to 100
-- whose remainder when devided by 7 is 3
compC = [x | x <- [50..100], x `mod` 7 == 3] -- [52,59,66,73,80,87,94]

boomBang :: Integral a => [a] -> [[Char]]
boomBang xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
compD = boomBang [8..12] -- ["BOOM!", "BANG!"]

compE = [x | x <- [10..20], x /= 13, x /= 15, x /= 19]  -- [10,11,12,14,16,17,18,20]
compF = [x+y | x <- [1,2,3], y <- [10,100,1000]]        -- [11,101,1001,12,102,1002,13,103,1003]
compG = [x*y | x <- [2,5,10], y <- [8,10,11]]           -- [16,20,22,40,50,55,80,100,110]
compH = [x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50] -- [55,80,100,110]

nouns = ["hobo","frog","pope"]
adjectives = ["lazy","grouchy","scheming"]
nAndA = [a ++ " " ++ n | a<-adjectives, n<-nouns]

length' :: Num a => [t] -> a
length' xs = sum [1 | _ <- xs]

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]








