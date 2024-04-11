defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
    :ok
  end

  def ask_name() do
    IO.gets("What is your character's name?\n")
    |> String.trim()
  end

  def ask_class() do
    IO.gets("What is your character's class?\n")
    |> String.trim()
  end

  def ask_level() do
    IO.gets("What is your character's level?\n")
    |> String.trim()
    |> String.to_integer()
  end

  def run() do
    welcome()
    nm = ask_name()
    cls = ask_class()
    lvl = ask_level()
    total = %{class: cls, level: lvl, name: nm}
    IO.inspect(total, label: "Your character")
    total
  end
end
