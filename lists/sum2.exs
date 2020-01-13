defmodule MyList do
  def sum(list), do: _sum(list, 0)

  defp _sum([], total), do: total
  defp _sum([head|tail], total), do: _sum(tail, head+total)

  def sum2([]), do: 0
  def sum2([head|tail]), do: head+sum2(tail)
end