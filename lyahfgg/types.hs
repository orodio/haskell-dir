removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c<-st, elem c ['A'..'Z']]

-- Int = bounded Integer (more performant, has a min and max value)
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- Integer - unbounded Integer (less performant)
factorial :: Integer -> Integer
factorial x = product [1..x]

-- Floating Point number with single precision
cirumference :: Float -> Float
cirumference r = 2 * pi * r
-- circumference 4.0 => 25.132742

-- Floating Point number with double precision
cirumference' :: Double -> Double
cirumference' r = 2 * pi * r
-- circumference 4.0 => 25.13274228718345

data Shape = Circle Float Float Float | Rectangle Float Float Float Float
