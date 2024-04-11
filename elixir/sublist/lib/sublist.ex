defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare([], []), do: :equal
  def compare(_, []), do: :superlist
  def compare([], _), do: :sublist

  def compare(a, b) do
    cond do
      # If they are eual in size it has to be an exact check
      length(a) == length(b) ->
        if check_equal(a, b) do
          :equal
        else
          :unequal
        end

      length(a) < length(b) ->
        if check_contains(a, b) do
          :sublist
        else
          :unequal
        end

      length(a) > length(b) ->
        if check_contains(b, a) do
          :superlist
        else
          :unequal
        end
    end
  end

  def check_equal([], []), do: true
  def check_equal([hd_a | tail_a], [hd_b | tail_b]) do
    if(hd_a === hd_b) do
      check_equal(tail_a, tail_b)
    else
      false
    end
  end

  def check_contains(sm_lst, lg_lst) do
    Enum.chunk_every(lg_lst, length(sm_lst), 1, :discard)
    |> Enum.any?(fn x -> check_equal(sm_lst, x) end)
  end
end
