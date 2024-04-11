defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(digits, input_base, output_base) do
    cond do
      any_neg(digits) -> {:error, "all digits must be >= 0 and < input base"}
      input_base < 0 && output_base < 0 -> {:error, "input base must be >= 2"}
      input_base < 2 -> {:error, "input base must be >= 2"}
      output_base < 2 -> {:error, "output base must be >= 2"}
      input_base < 2 -> {:error, "input base must be >= 2"}
      digits == [] -> {:ok, [0]}
      check_input_elems(digits, input_base) -> {:error, "all digits must be >= 0 and < input base"}
      true -> process(digits, input_base, output_base)
    end
  end

  def process(digits, input_base, output_base) do
    wrap_in_tuple = fn v -> {:ok, v} end

    Enum.map(digits, & convup(&1))
    |> Enum.join("")
    |> String.to_integer(input_base)
    |> Integer.digits(output_base)
    |> wrap_in_tuple.()
  end

  def convup(x) do
    case x do
      10 -> "A"
      11 -> "B"
      12 -> "C"
      13 -> "D"
      14 -> "E"
      15 -> "F"
      _ -> x
    end
  end

  def check_input_elems(digits, input_base), do: Enum.any?(digits, & &1 < 0 || &1 >= input_base )
  def any_neg(digits), do: Enum.any?(digits, & &1 < 0)

end
