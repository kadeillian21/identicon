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
    |> pick_color
  end

  @doc """
    The pick_color methods returns the first three elements from the hash_input result.  We do this by using pattern matching to assign the variables r, b, and g, and then use _tail to store the rest of the elements of the hex_list that we do not care about.

    ## Examples

        iex> Identicon.main("asdf")
        [145, 46, 200]
  """
  def pick_color(image) do
    %Identicon.Image{hex: hex_list} = image
    [r, g, b | _tail] = hex_list
    [r, g, b]
  end

  def hash_input(input) do
    hex =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end
end
