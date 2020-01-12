IO.puts Enum.map [1,2,3,4], fn x -> x + 2 end
IO.puts Enum.map [1,2,3,4], &(&1 + 2)
