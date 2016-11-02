defmodule Bob do

  def hey(message) do
    cond do
      Language.is_silence?(message)   -> "Fine. Be that way!"
      Language.is_question?(message)  -> "Sure."
      Language.is_aggresive?(message) -> "Whoa, chill out!"
      true                            -> "Whatever."
    end
  end

end

defmodule Language do

  def is_aggresive?(message) do
    String.upcase(message) == message &&
      String.downcase(message) != message
  end

  def is_question?(message) do
    String.ends_with?(message, "?")
  end

  def is_silence?("") do
    true
  end

  def is_silence?(message) do
    false
  end

end
