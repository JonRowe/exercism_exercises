defmodule Anagram do

  def match(word, potential_anagrams) do
    Enum.filter potential_anagrams, &(anagram? String.downcase(word), String.downcase(&1))
  end

  defp anagram?(word, potential) do
    not_same?(word, potential) &&
    contains_all_chars?( String.codepoints(potential), String.codepoints(word) )
  end

  defp not_same?(a, b) do
    a != b
  end

  defp contains_all_chars?(list_a, list_b) do
    Enum.sort(list_a) == Enum.sort(list_b)
  end

end
