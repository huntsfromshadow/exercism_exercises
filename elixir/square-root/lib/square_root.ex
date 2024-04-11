# Yea I don't see not using a standard library.
# Feels like this isn't teaching anything but how to implment
# math that has been solved.
defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    :math.sqrt(radicand)
  end
end
