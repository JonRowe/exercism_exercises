defmodule Teenager do

  def hey(""),                         do: "Fine. Be that way!"

  def hey(text) do
    cond do
      String.ends_with?(text, "?") -> "Sure."
      String.upcase(text) == text  -> "Woah, chill out!"
      true                         -> "Whatever."
    end
  end

end
