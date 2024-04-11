defmodule Luhn do
  require Integer
  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    cond do
      number == "0" -> false
      number ==  " 0" -> false
      !(number =~ ~r/(^[\d|\s]*$)/) -> false
      true ->
        String.replace(number, " ", "")
        |> String.to_integer()
        |> Integer.digits()
        |> double_sum()
        |> Integer.mod(10)
        |> Kernel.==(0)
    end
  end

  def double_dig(true, val) when val * 2 <= 9, do: val * 2
  def double_dig(true, val) when val * 2 > 9, do: (val * 2) - 9
  def double_dig(false, val), do: val

  def step1_calc(lst) do
    Enum.map(lst,
      fn x ->
        {val, idx} = x
        double_dig(Integer.is_even(idx+1), val)
      end)
  end




  def double_sum(digits) do
    Enum.reverse(digits)
    |> Enum.with_index()
    |> step1_calc()
    |> Enum.sum()
  end


end
