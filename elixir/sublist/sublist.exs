defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      contains(a, b) -> :superlist
      contains(b, a) -> :sublist
      true -> :unequal
    end
  end

  defp contains(_, []), do: true
  defp contains([], _), do: false
  defp contains([x|a], [x|b]) do
    Enum.take(a, Enum.count(b)) === b || contains(a, [x|b])
  end
  defp contains([_|a], [y|b]), do: contains(a, [y|b])
end
