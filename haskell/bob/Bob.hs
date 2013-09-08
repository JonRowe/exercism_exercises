module Bob where
  import Data.Char

  data EmotionalContent = Silence | Aggression | Question | Meh

  instance Show EmotionalContent where
    show Silence = "Fine. Be that way!"
    show Aggression = "Woah, chill out!"
    show Question = "Sure."
    show Meh = "Whatever."

  responseFor :: String -> String
  responseFor message = show (classify message)

  classify :: String -> EmotionalContent
  classify message
    | isSilence    message = Silence
    | isAggressive message = Aggression
    | isQuestion   message = Question
    | otherwise            = Meh

  isAggressive :: String -> Bool
  isAggressive message = any isUpper message && all (not . isLower) message

  isQuestion :: String -> Bool
  isQuestion message = (last message) == '?'

  isSilence :: String -> Bool
  isSilence = all isSpace
