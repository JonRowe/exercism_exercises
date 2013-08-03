defmodule Teenager do

  def hey(""),                         do: "Fine. Be that way!"

  def hey(text) do
    cond do
      perceived_aggresive(text) -> "Woah, chill out!"
      asked_question(text)      -> "Sure."
      true                         -> "Whatever."
    end
  end

  def perceived_aggresive(text) do
    Regex.match?(%r/^[^a-z]+$/, text)
  end

  def asked_question(text) do
    Regex.match?(%r/\?$/, text)
  end

end
