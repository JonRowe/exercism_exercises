defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter( &(are_not_identical? base, &1) )
    |> Enum.filter( &(contains_all_chars? base, &1) )
  end

  defp are_not_identical?(word_a, word_b) do
    String.downcase(word_a) != String.downcase(word_b)
  end

  defp contains_all_chars?(word_a, word_b) do
    sorted_char_list(word_a) == sorted_char_list(word_b)
  end

  defp sorted_char_list(word) do
    word
    |> String.downcase
    |> String.codepoints
    |> Enum.sort
  end

end
