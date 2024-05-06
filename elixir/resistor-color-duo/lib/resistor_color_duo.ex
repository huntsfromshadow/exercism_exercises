defmodule ResistorColorDuo do
 @doc """
  Return the value of a color band
  """
  @spec code(atom) :: integer()
  def code(color) do
    case color do
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

@doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    Enum.slice(colors, 0..1)
    |> Enum.map(&(Integer.to_string(code(&1))))
    |> Enum.join("")
    |> String.to_integer()
  end
end
