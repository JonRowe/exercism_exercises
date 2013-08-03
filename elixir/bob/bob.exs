defmodule Teenager do

  def hey(""),                         do: "Fine. Be that way!"

  def hey(text) do
    cond do
      String.ends_with?(text, "?") -> "Sure."
      perceived_aggresive(text)    -> "Woah, chill out!"
      true                         -> "Whatever."
    end
  end

  def perceived_aggresive(text) do
    Regex.match?(%r/^[^a-z]+$/, text)
  end

end
