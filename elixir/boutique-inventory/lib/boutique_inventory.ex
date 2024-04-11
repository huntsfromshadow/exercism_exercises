defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory,
      fn x -> x.price end,
      :asc
    )
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory,
      fn x -> x.price == nil end
    )
  end

  def update_names(inventory, old_word, new_word) do
    update = fn x -> %{ x | name: String.replace(x.name, old_word, new_word) } end
    Enum.map(inventory, update)
  end

  def increase_quantity(item, count) do
    bump_inven = fn x -> %{ x |
      s: x.s + count,
      m: x.m + count,
      l: x.l + count,
      xl: x.xl + count }
    end

    if length(Map.keys(item.quantity_by_size)) == 0 do
      item
    else
      %{ item | quantity_by_size: bump_inven.(item.quantity_by_size) }
    end
  end

  def total_quantity(item) do
    if length(Map.keys(item.quantity_by_size)) == 0 do
     0
    else
      item.quantity_by_size.s + item.quantity_by_size.m + item.quantity_by_size.l + item.quantity_by_size.xl
    end
  end
end
