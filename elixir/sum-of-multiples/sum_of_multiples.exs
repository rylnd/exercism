defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.flat_map(&(multiples_up_to(&1, limit)))
    |> Enum.uniq
    |> Enum.sum
  end

  defp multiples_up_to(factor, limit) do
    for i <- 1..limit,
        factor * i < limit,
        do: factor * i
  end
end
