defmodule Anagram do

  def match(word, potential_anagrams) do
    Enum.filter potential_anagrams, &(anagram? word, &1)
  end

  defp anagram?(word, potential) do
    are_not_identical?(word, potential) && contains_all_chars?(word, potential)
  end

  defp are_not_identical?(word_a, word_b) do
    String.downcase(word_a) != String.downcase(word_b)
  end

  defp contains_all_chars?(word_a, word_b) do
    chars(word_a) == chars(word_b)
  end

  defp chars(word) do
    word
    |>
    String.downcase
    |>
    String.codepoints
    |>
    Enum.sort
  end

end
