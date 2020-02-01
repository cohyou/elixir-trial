defmodule MyString do
  def read_tax_info(file_name) do
    {:ok, file} = File.open(file_name)

    basic = IO.read(file, :line)
    |> String.split(",")    
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_atom/1)

    Enum.map(IO.stream(file, :line),
    fn line ->
      line
      |> String.trim
      |> String.split(",")
      |> (fn [id, ship_to, net_amount] ->
           [
             String.to_integer(id),
             ship_to |> String.trim_leading(":") |> String.to_atom,
             String.to_float(net_amount)
           ]
         end).()
      |> (&(Enum.zip(basic, &1))).()      
    end)
    

  end
end

MyString.read_tax_info("tax_info.csv")
|> IO.inspect

# [
#   [ id: 123, ship_to: :NC, net_amount: 100.00 ],
#   [ id: 124, ship_to: :OK, net_amount:  35.50 ],
#   [ id: 125, ship_to: :TX, net_amount:  24.00 ],
#   [ id: 126, ship_to: :TX, net_amount:  44.80 ],
#   [ id: 127, ship_to: :NC, net_amount:  25.00 ],
#   [ id: 128, ship_to: :MA, net_amount:  10.00 ],
#   [ id: 129, ship_to: :CA, net_amount: 102.00 ],
#   [ id: 130, ship_to: :NC, net_amount:  50.00 ],
# ]