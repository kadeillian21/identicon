defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
  Identicon generates a custom 'identicon' for the user based on an input string.  The string is hashed and converted into a series of integers, which generates a unique 'identicon'.  Identicons are 250px by 250px, have a 5x5 grid, and the image mirrors itself across the x-axis.  Identicons colors are also randomly generated.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def main(input) do
    input
    |> hash_input()
  end

  def hash_input(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list()
  end
end
