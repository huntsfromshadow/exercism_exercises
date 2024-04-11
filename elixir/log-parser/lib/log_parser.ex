# thanks
# https://exercism.org/tracks/elixir/exercises/log-parser/solutions/mdswe for the regexp for
# tag user name

defmodule LogParser do
  def valid_line?(line) do
    a = String.starts_with?(line, "[DEBUG]") || String.starts_with?(line, "[INFO]")
    b = String.starts_with?(line, "[WARNING]") || String.starts_with?(line, "[ERROR]")
    a || b
  end

  def split_line(line) do
    String.split(line, ~r/<[-|*|=|~]*>/)
  end

  def remove_artifacts(line) do
    String.replace(line, ~r/end-of-line\d+/i, "")
  end

  def tag_with_user_name(line) do
    case Regex.scan(~r/User\s+(\S+)/u, line) do
      [[_, username]] -> "[USER] #{username} #{line}"
      _ -> line
    end
  end
end
