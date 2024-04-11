defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    a = k1(list, fun)
  end

  def k1([], fun), do: []

  def k1(list, fun) do
      [head | tail] = list
      if fun.(head) do
        [head] ++ k1(tail, fun)
      else
        k1(tail,fun)
      end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    a = d1(list, fun)
  end

  def d1([], fun), do: []

  def d1(list, fun) do
      [head | tail] = list
      if !fun.(head) do
        [head] ++ d1(tail, fun)
      else
        d1(tail,fun)
      end
  end
end
