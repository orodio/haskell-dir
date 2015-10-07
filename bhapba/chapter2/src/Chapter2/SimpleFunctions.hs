module Chapter2.SimpleFunctions where

firstOrEmpty :: [[Char]] -> [Char]
firstOrEmpty lst = if not (null lst) then head lst else "empty"

lst1 +++ lst2 = if null lst1
                then lst2
                else (head lst1) : (tail lst1 +++ lst2)

reverse2 lst = if null lst
               then []
               else reverse2 (tail lst) +++ [head lst]

maxmin' list = if null (tail list)
              then (head list, head list)
              else (  if (head list) > fst (maxmin (tail list))
                      then head list
                      else fst (maxmin (tail list))
                   ,  if (head list) < snd (maxmin (tail list))
                      then head list
                      else snd (maxmin (tail list))
                   )

maxmin list = let h = head list
              in if null (tail list)
              then (h, h)
              else ( if h > t_max then h else t_max
                   , if h < t_min then h else t_min )
                   where t = maxmin (tail list)
                         t_max = fst t
                         t_min = snd t

data Client = GovOrg     String
            | Company    String Integer Person String
            | Individual Person Bool
            deriving Show

data Person = Person String String
            deriving Show

clientName :: Client -> Maybe String
clientName client = case client of
                      GovOrg name         -> Just name
                      Company name _ _ _  -> Just name
                      Individual person _ ->
                        case person of Person fName lName -> Just (fName ++ " " ++ lName)
                      _ -> Nothing
