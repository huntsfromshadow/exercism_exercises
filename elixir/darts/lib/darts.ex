defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    a = within_radius(x,y,10)
    b = within_radius(x,y,5)
    c = within_radius(x,y,1)
    cond do
      a && b && c -> 1
      !a && b && c -> 5
      !a && !b && c -> 10
      true -> 0
    end
  end

  def within_radius(x,y,r) do
    v = :math.sqrt(:math.pow(abs(x),2) + :math.pow(abs(y),2))
    if v < r do
      true
    else
      false
    end
  end
end
