defmodule NameBadge do
  def print(id, name, department) do
    "#{id_block(id)}#{name} - #{dept_block(department)}"
  end

  def id_block(id) do
    cond do
      id == nil -> ""
      true      -> "[#{id}] - "
    end
  end

  def dept_block(dept) do
    cond do
      dept == nil -> "OWNER"
      true      -> String.upcase(dept)
    end
  end
end
