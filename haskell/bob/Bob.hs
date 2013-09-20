module Bob (responseFor) where
import Data.Char

data EmotionalContent = Silence | Aggression | Question | Meh

responseFor :: String -> String
responseFor = display . classify

display :: EmotionalContent -> String
display Silence    = "Fine. Be that way!"
display Aggression = "Woah, chill out!"
display Question   = "Sure."
display Meh        = "Whatever."

classify :: String -> EmotionalContent
classify message
  | isSilence    message = Silence
  | isAggressive message = Aggression
  | isQuestion   message = Question
  | otherwise            = Meh

isAggressive :: String -> Bool
isAggressive message = any isUpper message && all (not . isLower) message

isQuestion :: String -> Bool
isQuestion message = not (null message) && last message == '?'

isSilence :: String -> Bool
isSilence = all isSpace
