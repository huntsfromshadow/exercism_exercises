defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    tl(list)
  end

  def first(list) do
    hd(list)
  end

  def count(list) do
    Enum.count(list)
  end

  def functional_list?(list) do
    Enum.find(list, fn x -> x == "Elixir" end)
  end
end
