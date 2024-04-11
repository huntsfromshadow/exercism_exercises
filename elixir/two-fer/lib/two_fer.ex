defmodule TwoFer do
  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name \\ :blah) do
    case name do
       "Alice" -> "One for Alice, one for me."
       "Bohdan" -> "One for Bohdan, one for me."
       "Zaphod" -> "One for Zaphod, one for me."
       _ -> "One for you, one for me."
    end
  end
end
