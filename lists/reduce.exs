defmodule MyList do
  def reduce([], value, _), do: value
  def reduce([head|tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def mapsum([], func), do: 0
  def mapsum([head|tail], func) do
    func.(head) + mapsum(tail, func)
  end

  def max(list), do: _max(list, 0)
  def _max([], val), do: val
  def _max([head|tail], val) when head > val, do: _max(tail, head)
  def _max([head|tail], val), do: _max(tail, val)

  def ceasar([], _), do: []
  def ceasar([head|tail], n) when head+n > 123 do
    [head - 26|ceasar(tail, n)]
  end
  def ceasar([head|tail], n) do
    [head|ceasar(tail, n)]
  end
end