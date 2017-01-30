defmodule Bob do
  def hey(input) do
    cond do
      String.match?(input, ~r/\?$/) ->
        "Sure."
      String.upcase(input) == input &&
      String.downcase(input) != input ->
        "Whoa, chill out!"
      String.trim(input) == "" ->
        "Fine. Be that way!"
      true ->
        "Whatever."
    end
  end
end
