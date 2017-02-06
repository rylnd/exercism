defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.codepoints
    |> run_lengths([])
    |> Enum.map(fn({char, count}) -> "#{count}#{char}" end)
    |> Enum.join
  end

  defp run_lengths([], string) do
    Enum.reverse(string)
  end
  defp run_lengths([char|string], [{char, count}|out]) do
    run_lengths(string, [{char, count+1}|out])
  end
  defp run_lengths([char|string], out) do
    run_lengths(string, [{char, 1}|out])
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    ~r/(\d+)([^\d])/
    |> Regex.scan(string)
    |> Enum.map(fn([_, count, char]) ->
      String.duplicate(char, String.to_integer(count))
    end)
    |> Enum.join
  end
end
