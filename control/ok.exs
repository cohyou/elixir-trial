defmodule Util do
  def ok!({:ok, data}), do: data
  def ok!(data), do: raise RuntimeError, message: IO.inspect(data)
end