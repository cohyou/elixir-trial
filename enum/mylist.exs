defmodule MyList do
  def all?(enumerable, pred) do    
    _all? Enum.to_list(enumerable), pred, true
  end
  defp _all?([], _, acc) do
    acc
  end
  defp _all?([head|tail], pred, true) do
    _all? tail, pred, pred.(head)
  end
  defp _all?(_, _, false) do
    false
  end

  def each(enumerable, fun) do    
    _each(Enum.to_list(enumerable), fun)
  end
  defp _each([], _) do
    :ok
  end
  defp _each([head|tail], fun) do
    fun.(head)
    _each(tail, fun)
  end

  def filter(enumerable, fun) do
    _filter(Enum.to_list(enumerable), fun, [])
  end
  defp _filter([], _, acc) do
    acc
  end
  defp _filter([head|tail], fun, acc) do
    if fun.(head) do
      _filter tail, fun, acc ++ [head]
    else
      _filter tail, fun, acc
    end
  end

  def split(enumerable, count) when count >= 0 do
    list = Enum.to_list(enumerable)
    _split Enum.to_list(enumerable), count, [], list
  end
  def split(enumerable, count) do
    list = Enum.to_list(enumerable)
    _split list, length(list) - count, [], list 
  end
  defp _split([], _, prev, next), do: {prev, next}
  defp _split(_, 0, prev, next), do: {prev, next}
  defp _split([head|tail], count, prev, _) do
    _split tail, count - 1, prev ++ [head], tail
  end

  def take(enumerable, amount) when amount > 0 do
    _take_positive Enum.to_list(enumerable), amount, []
  end
  def take(enumerable, amount) when amount < 0 do
    list = Enum.to_list(enumerable)
    _take_negative list, -(length(list) + amount)
  end
  def take(enumerable, _), do: Enum.to_list(enumerable)

  defp _take_positive([], _, acc), do: acc
  defp _take_positive(_, 0, acc), do: acc
  defp _take_positive([head|tail], amount, acc) do
    _take_positive tail, amount - 1, acc ++ [head]
  end
  defp _take_negative(tail, 0), do: tail
  defp _take_negative([], _), do: []
  defp _take_negative([_|tail], amount) do
    _take_negative tail, amount + 1    
  end

  def flatten(list), do: _flatten(list, [])
  def _flatten([], acc), do: acc
  def _flatten([head|tail], acc) do
    _flatten(head, _flatten(tail, acc))
  end
  def _flatten(atom, acc), do: [atom|acc]
end