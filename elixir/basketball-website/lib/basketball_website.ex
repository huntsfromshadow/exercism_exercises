defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    pth = String.split(path,".")

    cond do
      data[hd(pth)] == nil -> nil
      is_map(data[hd(pth)]) -> extract_from_path(data[hd(pth)],Enum.join(tl(pth), "."))
      true -> data[hd(pth)]
    end

  end

  def get_in_path(data, path) do

    a = String.split(path, ".")
    get_in(data, a )


  end
end
