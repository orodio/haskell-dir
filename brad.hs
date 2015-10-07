
addTheThings [] = 0
addTheThings [x] = x
addTheThings [x:y:xs] = x + y + (addTheThings xs)

