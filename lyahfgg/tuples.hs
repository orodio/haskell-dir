tupA = (1,3)
tupB = (3, 'a', "hello")
tupC = (50,50.4, "hello", 'b')
tupD = [(1,2), (2,3), (3,4)]

-- fst and snd only work on a pair (a,b)
-- not on a triple or largers ie: (a,b,c) or (a,b,c,d)
tupE = fst tupA -- 1
tupF = snd tupA -- 3

tupG = zip [1,2,3,4,5] [5,5,5,5,5]       -- [(1,5), (2,5), (3,5), (4,5), (5,5)]
tupH = zip [1..3] ["one", "two", "three"] -- [(1,"one"), (2,"two"), (3,"three")]
tupI = zip [1..] ['a','b','c','d','e']    -- [(1,'a'), (2,'b'), (3,'c'), (4,'d'), (5,'e')]

-- Finding the right triangle
--
-- Find a right triangle that fits all of these conditions
-- * length of the three sides are all integers
-- * lenght of each side is less than or equal to 10
-- * triangles perimeter is equal to 24

rightTriangles = [(a,b,c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a+b+c == 24]

