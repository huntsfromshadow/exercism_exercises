defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do

    dl = Integer.digits(number) |> length()

    Integer.digits(number)
    |> Enum.reduce(0, fn x, acc -> acc + Integer.pow(x, dl) end)
    |> Kernel.==(number)
  end
end
