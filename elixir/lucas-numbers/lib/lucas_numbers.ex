# thanks to https://exercism.org/tracks/elixir/exercises/lucas-numbers/solutions/bazz
defmodule LucasNumbers do
  @moduledoc """
  Lucas numbers are an infinite sequence of numbers which build progressively
  which hold a strong correlation to the golden ratio (φ or ϕ)

  E.g.: 2, 1, 3, 4, 7, 11, 18, 29, ...
  """

  def generate(count) when count == 1, do: [2]
  def generate(count) when count == 2, do: [2, 1]
  def generate(count) when is_number(count) == false, do: (raise ArgumentError, "count must be specified as an integer >= 1")
  def generate(count) when count <= 0, do: (raise ArgumentError, "count must be specified as an integer >= 1")
  def generate(count) do
    {2, 1}
    |> Stream.unfold(fn {x, y} -> {x, {y, x + y}} end)
    |> Enum.take(count)
  end
end
