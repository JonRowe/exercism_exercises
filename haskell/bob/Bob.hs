module Bob where
  responseFor message = do
    case message of
      Language.is_silence    message -> "Fine. Be that way!"
      Language.is_aggresive message -> "Woah, chill out!"
      Language.is_question  message -> "Sure."
      _                           -> "Whatever."

module Language where
  is_silence   text = text == ""
  is_aggresive text = false
  is_question  text = false
