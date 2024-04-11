defmodule Chessboard do
  def rank_range do
    1..8
  end

  def file_range do
    ?A..?H
  end

  def ranks do
    Enum.to_list rank_range()
  end

  def files do
    Enum.to_list file_range()
    |> Enum.map(fn x -> <<x::utf8>> end )

  end
end
