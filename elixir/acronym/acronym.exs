defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.split(~r{[A-Z]?[a-z]+}, string, include_captures: true, trim: true)
    |> Enum.filter(fn(part) -> String.match?(part, ~r{^\w+$}) end)
    |> Enum.map_join(&String.first/1)
    |> String.upcase
  end
end
