defmodule MyList do
  def center(strings) do    
    max_str = Enum.max_by strings, &String.length/1
    Enum.each strings, _center(String.length max_str)
  end

  defp _center(max_length) do    
    fn str ->
      sp_len = max_length - String.length(str)
      sp = String.duplicate " ", div(sp_len, 2)
      IO.puts "#{sp}#{str}"
    end
  end
end

MyList.center(["あra", "zebra", "elephant"])