defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase
    |> String.codepoints
    |> Enum.map(&character_score/1)
    |> Enum.sum
  end

  defp character_score(char) do
    cond do
      String.contains?("aeioulnrst", char) -> 1
      String.contains?("dg", char) -> 2
      String.contains?("bcmp", char) -> 3
      String.contains?("fhvwy", char) -> 4
      String.contains?("k", char) -> 5
      String.contains?("jx", char) -> 8
      String.contains?("qz", char) -> 10
      true -> 0
    end
  end
end
