defmodule ExemplosTupla do
  def area({:quadrado, lado}), do: lado * lado
  def area({:retangulo, base, altura}), do: base * altura
  def area({:circulo, raio}), do: :math.pi() * raio * raio
end

defmodule Lista5 do
  def soma_tuplas({{a, b}, {c, d}}), do: a + b + c + d

  def shift({{x, y}, z}), do: {x, {y, z}}

  def min_e_max(n1, n2, n3), do: {min(min(n1, n2), n3), max(max(n1, n2), n3)}

  def soma_lista_tuplas([]), do: 0
  def soma_lista_tuplas([h|t]), do: Tuple.sum(h)+ Lista5.soma_lista_tuplas(t) # Versao generica usando Tuple.sum
  # def soma_lista_tuplas([{n1, n2} | t]), do: n1 + n2 + Lista5.soma_lista_tuplas(t) # Versao utilizando dois elementos

  def zip([], _), do: []
  def zip(_, []), do: []
  def zip([h|t], [h2|t2]), do: [{h, h2} | Lista5.zip(t, t2)]

  def zip_tres([], [], []), do: []
  def zip_tres([], _, _), do: []
  def zip_tres(_, [], _), do: []
  def zip_tres(_, _, []), do: []
  def zip_tres([h1|t1], [h2|t2], [h3|t3]), do: [{h1, h2, h3} | Lista5.zip_tres(t1, t2, t3)]

  def unzip_esq([]), do: []
  def unzip_esq([{n1, _n2} | t]), do: [n1 | Lista5.unzip_esq(t)]
  def unzip_dir([]), do: []
  def unzip_dir([{_n1, n2} | t]), do: [n2 | Lista5.unzip_dir(t)]
  def unzip([]),do: []
  def unzip([h| t]), do: {Lista5.unzip_esq([h|t]), Lista5.unzip_dir([h|t])}
end
