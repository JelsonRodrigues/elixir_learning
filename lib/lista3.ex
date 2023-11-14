defmodule ExemplosLista do
  def mostra_lista([]) do
    IO.write(:stderr, "\n")
  end
  def mostra_lista([h|t]) do
    IO.write(:stderr, "#{h} ")
    mostra_lista(t)
  end
end

defmodule Lista3 do
  def mult_dois_lista([]), do: []
  def mult_dois_lista([h | t]), do: [2*h | Lista3.mult_dois_lista(t)]

  def tamanho([]), do: 0
  def tamanho([_h | t]), do: 1 + Lista3.tamanho(t)

  def produto_lista([]), do: 0
  def produto_lista([h | []]), do: h
  def produto_lista([h | t]), do: h * produto_lista(t)

  def and_lista([]), do: false
  def and_lista([h| []]), do: h
  def and_lista([h|t]), do: h && Lista3.and_lista(t)

  def insere_final(item, []), do: [item]
  def insere_final(item, [h|t]), do: [h | Lista3.insere_final(item, t)]

  def neg_lista([]), do: []
  def neg_lista([h | []]), do: [not h]
  def neg_lista([h | t]), do: [not h | Lista3.neg_lista(t)]

  def join([], []), do: []
  def join([], [h|t]), do: [h | t]
  def join([h|t], []), do: [h | t]
  def join([h | t], [h2 | t2]), do: [h | Lista3.join(t, [h2 | t2])]

  def concat_lista([]), do: []
  def concat_lista([h | t]), do: Lista3.join(h, Lista3.concat_lista(t))

  def inverte_lista([]), do: []
  def inverte_lista([h | t]), do: Lista3.join(Lista3.inverte_lista(t), [h])
end
