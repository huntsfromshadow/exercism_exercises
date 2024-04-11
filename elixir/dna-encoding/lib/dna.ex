defmodule DNA do

  #thanks - https://exercism.org/tracks/elixir/exercises/dna-encoding/solutions/iiiyu

  def encode_nucleotide(code_point) do
    case code_point do
      32 -> 0b0000
      65 -> 0b0001
      67 -> 0b0010
      71 -> 0b0100
      84 -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> 32
      0b0001 -> 65
      0b0010 -> 67
      0b0100 -> 71
      0b1000 -> 84
    end
  end

  def encode([]) do
    <<>>
  end

  def encode([head | tail]) do
    <<(<<encode_nucleotide(head)::4>>)::bitstring, encode(tail)::bitstring>>
  end

  def decode("") do
    ''
  end

  def decode(<<value::4, rest::bitstring>>) do
    [decode_nucleotide(value)] ++ decode(rest)
  end
end
