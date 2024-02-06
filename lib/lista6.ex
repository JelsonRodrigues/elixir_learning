defmodule MapImplementation do
  def map([], _fun), do: []
  def map([h | t], fun), do: [fun.(h) | MapImplementation.map(t, fun)]

  def inc(x), do: x + 1
end

defmodule Lista6 do
  def aplica_duas_vezes(val, fun), do: fun.(fun.(val))

  def iter(_fun, 0, initial_value), do: initial_value

  def iter(fun, iter, initial_value) when iter > 0,
    do: fun.(Lista6.iter(fun, iter - 1, initial_value))

  def filter([], _fun), do: []

  def filter([h | t], fun) do
    cond do
      fun.(h) -> [h | Lista6.filter(t, fun)]
      true -> Lista6.filter(t, fun)
    end
  end

  def foldl([], _fun, acc), do: acc
  def foldl([h | t], fun, acc), do: Lista6.foldl(t, fun, fun.(h, acc))

  def foldr([], _fun, acc), do: acc
  def foldr([h | t], fun, acc), do: fun.(h, Lista6.foldr(t, fun, acc))

  def concatena([]), do: []
  def concatena([h | t]), do: Lista6.foldr(t, &(&1 ++ &2), h)

  def soma_quad_positivos([]), do: 0

  def soma_quad_positivos([h | t]) do
    Lista6.foldl(
      MapImplementation.map(
        Lista6.filter([h | t], &(&1 > 0)),
        &(&1 * &1)
      ),
      &(&1 + &2),
      0
    )
  end

  def conta_elementos([]), do: 0

  def conta_elementos([h | t]),
    do: Lista6.foldr(MapImplementation.map([h | t], fn _x -> 1 end), &(&1 + &2), 0)

  def custom_mapper(num) do
    cond do
      num < 0 -> 1
      true -> 0
    end
  end

  def conta_neg([]), do: 0

  def conta_neg([h | t]),
    do: Lista6.foldr(MapImplementation.map([h | t], &Lista6.custom_mapper/1), &(&1 + &2), 0)

  def soma_lista([]), do: 0
  def soma_lista([h | t]), do: h + Lista6.soma_lista(t)
  def soma_listas([]), do: 0

  def soma_listas([h | t]) do
    Lista6.foldr(MapImplementation.map([h | t], &Lista6.soma_lista/1), &(&1 + &2), 0)
  end
end
