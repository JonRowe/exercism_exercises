module Bob where
  import Data.Char

  responseFor :: String -> String
  responseFor message
    | isSilence    message = "Fine. Be that way!"
    | isAggressive message = "Woah, chill out!"
    | isQuestion   message = "Sure."
    | otherwise            = "Whatever."

  isAggressive :: String -> Bool
  isAggressive message = do
    allTrue (map isUpper (filter isLetter message))

  isQuestion :: String -> Bool
  isQuestion message = do
    (last message) == '?'

  isSilence :: String -> Bool
  isSilence "" = True
  isSilence message = do
    allTrue (map isSpace message)

  allTrue :: [Bool] -> Bool
  allTrue [] = False
  allTrue list = do
    foldr1 (&&) list
