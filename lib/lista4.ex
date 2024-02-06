defmodule ExemplosSort do
  def ins(value, []), do: [value]

  def ins(value, [h | t]) do
    cond do
      value <= h -> [value | [h | t]]
      true -> [h | ExemplosSort.ins(value, t)]
    end
  end

  def insertion_sort([]), do: []
  def insertion_sort([h | t]), do: ExemplosSort.ins(h, ExemplosSort.insertion_sort(t))

  def first([h | _]), do: h
  def menor([h | []]), do: h
  def menor([h | t]), do: first(ExemplosSort.insertion_sort([h | t]))

  def last([h | []]), do: h
  def last([_ | t]), do: last(t)
  def maior([h | []]), do: h
  def maior([h | t]), do: last(ExemplosSort.insertion_sort([h | t]))

  def ins_remove_duplicates(value, []), do: [value]

  def ins_remove_duplicates(value, [h | t]) do
    cond do
      value == h -> [h | t]
      value < h -> [value | [h | t]]
      true -> [h | ExemplosSort.ins_remove_duplicates(value, t)]
    end
  end

  def insertion_sort_remove_duplicates([]), do: []

  def insertion_sort_remove_duplicates([h | t]),
    do: ExemplosSort.ins_remove_duplicates(h, ExemplosSort.insertion_sort_remove_duplicates(t))

  def ins_reverse(value, []), do: [value]

  def ins_reverse(value, [h | t]) do
    cond do
      value >= h -> [value | [h | t]]
      true -> [h | ExemplosSort.ins_reverse(value, t)]
    end
  end

  def insertion_sort_reverse([]), do: []

  def insertion_sort_reverse([h | t]),
    do: ExemplosSort.ins_reverse(h, ExemplosSort.insertion_sort_reverse(t))
end

defmodule Lista4 do
  def membro([], _), do: false
  def membro([h | t], n), do: h == n or membro(t, n)

  def quantas_vezes([], _), do: 0
  def quantas_vezes([h | t], n) when h == n, do: 1 + quantas_vezes(t, n)
  def quantas_vezes([h | t], n) when h != n, do: 0 + quantas_vezes(t, n)

  def membro_alternativa([], _), do: false
  def membro_alternativa([h | t], n), do: quantas_vezes([h | t], n) > 0

  def unicos([]), do: []

  def unicos([h | t]) do
    cond do
      quantas_vezes(t, h) > 0 -> unicos(t)
      true -> [h | unicos(t)]
    end
  end

  # Versão usando lambda e a função filter
  # def menores(_, []), do: []
  # def menores(n, [h|t]), do: [h|t] |> Enum.filter(&(&1 <= n))
  # def maiores(_, []), do: []
  # def maiores(n, [h|t]), do: [h|t] |> Enum.filter(&(&1 > n))

  def menores(_, []), do: []
  def menores(n, [h | t]) when n >= h, do: [h | menores(n, t)]
  def menores(n, [h | t]) when n < h, do: menores(n, t)

  def maiores(_, []), do: []
  def maiores(n, [h | t]) when n < h, do: [h | maiores(n, t)]
  def maiores(n, [h | t]) when n >= h, do: maiores(n, t)

  def quick_sort([]), do: []
  def quick_sort([h | t]), do: quick_sort(menores(h, t)) ++ [h] ++ quick_sort(maiores(h, t))
end
