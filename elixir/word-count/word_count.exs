defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    List.foldl list(sentence), %{}, &update_count(&1, &2)
  end

  defp list(words) do
    List.flatten Regex.scan ~r/(?:[^\W_]|-)+/u, String.downcase(words)
  end

  defp update_count(word, dict) do
    Map.update dict, word, 1, fn (count) -> count + 1 end
  end
end
