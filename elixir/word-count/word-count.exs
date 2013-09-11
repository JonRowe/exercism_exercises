defmodule Words do

  def count(words) do
    List.foldl list(words), HashDict.new, update_count
  end

  defp list(words) do
    List.flatten Regex.scan %r/\w+/, String.downcase(words)
  end

  defp update_count do
    fn (word, dict) ->
      HashDict.update dict, word, 1, fn (count) -> count + 1 end
    end
  end


end
