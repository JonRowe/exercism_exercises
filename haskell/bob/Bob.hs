module Bob where
  import Data.Char

  responseFor :: String -> String
  responseFor message
    | isSilence    message = "Fine. Be that way!"
    | isAggressive message = "Woah, chill out!"
    | isQuestion   message = "Sure."
    | otherwise            = "Whatever."

  isAggressive :: String -> Bool
  isAggressive message = any isUpper message && all (not . isLower) message

  isQuestion :: String -> Bool
  isQuestion message = (last message) == '?'

  isSilence :: String -> Bool
  isSilence = all isSpace
