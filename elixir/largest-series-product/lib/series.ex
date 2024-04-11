defmodule Series do
  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  def largest_product(_, size) when size < 0, do: raise(ArgumentError)

  @spec largest_product(String.t(), non_neg_integer) :: non_neg_integer
  def largest_product(number_string, size) do
    cond do
      String.to_integer(number_string) == 0 -> 0
      size > String.length(number_string) -> raise ArgumentError
      true ->
        String.to_integer(number_string)
        |> Integer.digits()
        |> Enum.chunk_every(size, 1, :discard)
        |> Enum.map(&Enum.product/1)
        |> Enum.max()
    end
  end
end
