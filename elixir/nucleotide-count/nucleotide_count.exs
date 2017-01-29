defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    count_recur(strand, nucleotide, 0)
  end

  @spec count_recur([char], char, non_neg_integer) :: non_neg_integer
  def count_recur([], nucleotide, count), do: count
  def count_recur([first | rest], nucleotide, count) do
    count = if first == nucleotide, do: count + 1, else: count
    count_recur(rest, nucleotide, count)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do

  end
end
