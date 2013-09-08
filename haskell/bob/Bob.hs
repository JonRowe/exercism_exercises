module Bob where
  import Data.Char

  responseFor :: String -> String
  responseFor message
    | isSilence    message = "Fine. Be that way!"
    | isAggressive message = "Woah, chill out!"
    | isQuestion   message = "Sure."
    | otherwise            = "Whatever."

  isAggressive :: String -> Bool
  isAggressive message = allTrue (map isUpper (filter isLetter message))

  isQuestion :: String -> Bool
  isQuestion message = (last message) == '?'

  isSilence :: String -> Bool
  isSilence message = all isSpace message

  allTrue :: [Bool] -> Bool
  allTrue [] = False
  allTrue list = foldr1 (&&) list
