defmodule Teenager do

  def hey(""),                         do: "Fine. Be that way!"

  def hey(message) do
    cond do
      Language.is_question?(message)  -> "Sure."
      Language.is_aggresive?(message) -> "Woah, chill out!"
      true                            -> "Whatever."
    end
  end

end

defmodule Language do

  def is_aggresive?(message) do
    String.upcase(message) == message
  end

  def is_question?(message) do
    String.ends_with?(message, "?")
  end

end
