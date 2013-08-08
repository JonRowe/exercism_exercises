defmodule Words do

  def count(words) do
    count_fnx = fn (word, dict) ->
      HashDict.update dict, word, 1, fn (count) -> count + 1 end
    end
    List.foldl list(words), HashDict.new, count_fnx
  end

  def list(words) do
    Enum.filter split(words), fn (word) -> String.length(word) > 0 end
  end

  def split(words) do
    String.split strip(words), %r/[^\w]+/
  end

  def strip(words) do
    Regex.replace %r/\s\+/, String.downcase(words), ' '
  end

end
