defmodule Words do

  def count(words) do
    count_fnx = fn (word, dict) ->
      HashDict.update dict, word, 1, fn (count) -> count + 1 end
    end
    List.foldl list(words), HashDict.new, count_fnx
  end

  def list(words) do
    Regex.scan %r/\w+/, String.downcase(words)
  end

end
