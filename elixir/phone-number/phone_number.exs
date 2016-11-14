defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw |> clean |> valid? |> Enum.join
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    String.slice pretty(raw), 1..3
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    sanitized = number raw
    "(#{String.slice sanitized, 0..2}) #{String.slice sanitized, 3..5}-#{String.slice sanitized, 6..-1}"
  end

  defp clean(raw) do
    raw
    |> String.replace(~r{[\(\)\s\-.]}, "")
    |> String.codepoints
  end

  defp valid?(raw) when length(raw) == 11 do
    cond do
      hd(raw) == "1" -> tl(raw)
      true -> valid?(false)
    end
  end
  defp valid?(raw) when length(raw) == 10, do: raw
  defp valid?(_), do: ["0000000000"]

end
