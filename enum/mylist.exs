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

  def each(enumerable, pred) do
    
  end
end