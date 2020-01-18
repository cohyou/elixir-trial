defmodule MyList do
  def span(from, to) when from == to, do: [to]
  def span(from, to), do: [from | span(from + 1, to)]

  def primes(n) do
    nums = MyList.span(2, n)
    pairs = for n <- nums do
      {n, (for nn <- nums, nn < n, do: nn)}
    end
    for {n, nns} <- pairs, Enum.all?(nns, &(rem(n, &1) != 0)), do: n    
  end  
end

IO.inspect MyList.primes(100)