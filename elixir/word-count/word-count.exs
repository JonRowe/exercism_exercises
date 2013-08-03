defmodule Words do

  def count(words) do
    count_fnx = fn (word, dict) ->
      HashDict.update dict, word, 1, fn (count) -> count + 1 end
    end
    List.foldl sane(words), HashDict.new, count_fnx
  end

  def sane(words) do
    String.split clean(words)
  end

  def clean(words) do
    Regex.replace %r/[^a-zA-Z0-9\s]+/, strip(words), ''
  end

  def strip(words) do
    Regex.replace %r/\s\+/, String.downcase(words), ' '
  end

end
