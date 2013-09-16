defmodule Anagram do

  def match(word, potential_anagrams) do
    Enum.filter potential_anagrams, &(is_anagram? String.downcase(word), String.downcase(&1))
  end

  defp is_anagram?(word, potential) do
    word != potential &&
    contains_all_chars?( String.codepoints(potential), String.codepoints(word) )
  end

  defp contains_all_chars?(list_a, list_b) do
    Enum.sort(list_a) == Enum.sort(list_b)
  end

end
