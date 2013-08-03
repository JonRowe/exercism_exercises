defmodule Teenager do

  def hey(text) when text == "" do
    "Fine. Be that way!"
  end

  def hey(text) do
    cond do
      perceived_aggresive(text) -> "Woah, chill out!"
      asked_question(text)      -> "Sure."
      otherwise                 -> "Whatever."
    end
  end

  def perceived_aggresive(text) do
    Regex.match?(%r/^[^a-z]+$/, text)
  end

  def asked_question(text) do
    Regex.match?(%r/\?$/, text)
  end

  def otherwise do
    true
  end

end
