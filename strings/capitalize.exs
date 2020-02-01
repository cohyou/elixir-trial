defmodule Capitalize do
  def capitalize_sentences(str) do
    String.split(str, ". ")
    |> Enum.map(&String.capitalize/1)
    |> _join
    |> String.replace_suffix(". ", "")
    |> IO.puts
  end
  def _join([]), do: ""
  def _join([head|tail]) do
    head <> ". " <> _join(tail)
  end
end

Capitalize.capitalize_sentences("oh. a DOG. woof. ")