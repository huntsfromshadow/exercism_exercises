defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    [c1, c2, c3] = Enum.take(colors, 3)
    num = String.to_integer(color_to_unit(c1) <> color_to_unit(c2) <> extra_zero(c3))

    cond do
      c3 == :black -> {num, :ohms}
      c3 == :brown -> {num, :ohms}
      c3 == :red -> {num / 1000, :kiloohms}
      c3 == :orange -> {num / 1000, :kiloohms}
      c3 == :yellow -> {num / 1000, :kiloohms}
      c3 == :green -> {num, :ohms}
      c3 == :blue -> {num / 1000000, :megaohms}
      c3 == :violet -> {num, :ohms}
      c3 == :grey -> {num, :ohms}
      c3 == :white -> {num / 1000000000, :gigaohms}
    end
  end

  def color_to_unit(c, use_string \\ true) do
    if use_string do
      case c do
        :black -> "0"
        :brown -> "1"
        :red -> "2"
        :orange -> "3"
        :yellow -> "4"
        :green -> "5"
        :blue -> "6"
        :violet -> "7"
        :grey -> "8"
        :white -> "9"
      end
    else
      case c do
        :black -> 0
        :brown -> 1
        :red -> 2
        :orange -> 3
        :yellow -> 4
        :green -> 5
        :blue -> 6
        :violet -> 7
        :grey -> 8
        :white -> 9
      end
    end
  end

  def extra_zero(c) do
    String.duplicate("0", color_to_unit(c, false))
  end

  def zeroes_to_unit(z) do
    case String.length(z) do
      0 -> :ohms
    end
  end
end
