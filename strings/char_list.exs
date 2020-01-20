defmodule CharList do
  def printable?(charlist) do
    Enum.all?(charlist, &(&1 in 0x20..?~))
  end

  def anagram?(word1, word2) do
    MapSet.new(word1) === MapSet.new(word2)
  end

  def calculate(charlist) do
    _tokenize(charlist)
  end

  defp _tokenize(charlist) do
    op_idx = Enum.find_index(charlist, &(&1 in '+-*/'))
    n1 = _scan(charlist, 0)
    op = Enum.at(charlist, op_idx)

    after_charlist = Enum.slice(charlist, (op_idx+1)..length(charlist))
    n2 = _scan(after_charlist, 0)
    # "#{n1}, #{[op]}, #{n2}"
    _calc(n1, op, n2)
  end

  defp _scan([], n), do: n
  defp _scan([a|tail], n) when a in '+-*/', do: n
  defp _scan([0x20|tail], n), do: _scan(tail, n)
  defp _scan([digit|tail], n) when digit in ?0..?9 do
    IO.puts "#{digit - ?0} #{tail}"
    _scan(tail, n * 10 + (digit - ?0))
  end

  defp _calc(n1, ?+, n2), do: n1 + n2
  defp _calc(n1, ?-, n2), do: n1 - n2
  defp _calc(n1, ?*, n2), do: n1 * n2
  defp _calc(n1, ?/, n2), do: n1 / n2
end

IO.puts CharList.calculate('123 + 27')