defmodule Anagram do

  def match(word, potential_anagrams) do
    Enum.filter potential_anagrams, &(anagram? String.downcase(word), String.downcase(&1))
  end

  defp anagram?(word, potential) do
    not_same?(word, potential) && contains_all_chars?(word, potential)
  end

  defp not_same?(a, b) do
    a != b
  end

  defp contains_all_chars?(word_a, word_b) do
    chars(word_a) == chars(word_b)
  end

  defp chars(word) do
    word
    |>
    String.codepoints
    |>
    Enum.sort
  end

end
