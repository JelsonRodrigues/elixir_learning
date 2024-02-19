defmodule Lista7 do
  def conta_positivos([]), do: 0
  def conta_positivos([h|t]) do
    [h|t]
    |> Enum.filter(fn(x) -> x >= 0 end)
    |> Enum.map(fn(_x)-> 1 end)
    |> Enum.reduce(fn(x, y) -> x + y end)
  end

  def mais_de_cinco([]), do: []
  def mais_de_cinco([h | t]) do
    [h | t]
    |> Enum.filter(fn({_prod, qtd, _prec}) -> qtd > 5 end)
    |> Enum.map(fn({prod, qtd, prec}) -> {prod, qtd, prec * 0.9} end)
  end

  def lucro_loja([]), do: 0.0
  def lucro_loja([h|t]) do
    [h|t]
    |> Lista7.mais_de_cinco
    |> Enum.map(fn({_prod, qtd, prec}) -> qtd * prec end)
    |> Enum.reduce(&(&1 + &2))
  end

end
