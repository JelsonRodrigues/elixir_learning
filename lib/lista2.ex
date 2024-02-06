defmodule Exemplos do
  def fatorial(0), do: 1
  def fatorial(n), do: n * fatorial(n - 1)
end

defmodule Vendas do
  def vendas(0), do: 33
  def vendas(1), do: 22
  def vendas(3), do: 0
  def vendas(4), do: 66
  def vendas(5), do: 0
  def vendas(_), do: 22
  def venda_total(0), do: vendas(0)
  def venda_total(n), do: vendas(n) + venda_total(n - 1)
end

defmodule Helper do
  def maxi(x, y) do
    cond do
      x >= y -> x
      y >= x -> y
    end
  end
end

defmodule Lista2 do
  def maior_venda(0), do: Vendas.vendas(0)
  def maior_venda(n), do: Helper.maxi(Vendas.vendas(n), maior_venda(n - 1))

  def semana_max_venda(0), do: 0

  def semana_max_venda(n) do
    cond do
      Lista2.maior_venda(n) == Vendas.vendas(n) -> n
      true -> Lista2.semana_max_venda(n - 1)
    end
  end

  def zero_vendas(n) do
    cond do
      n < 0 -> -1
      Vendas.vendas(n) == 0 -> n
      true -> Lista2.zero_vendas(n - 1)
    end
  end

  def acha_semana(s, n) do
    cond do
      n < 0 -> -1
      Vendas.vendas(n) == s -> n
      true -> acha_semana(s, n - 1)
    end
  end

  def zero_vendas2(n) do
    Lista2.acha_semana(0, n)
  end

  def multiplica_no_intervalo(m, n) when m <= n do
    cond do
      m == n -> n
      true -> m * multiplica_no_intervalo(m + 1, n)
    end
  end

  def potencia(_, expoente) when expoente == 0, do: 1
  def potencia(base, expoente) when expoente == 1, do: base
  def potencia(base, expoente) when expoente < 0 and base != 0, do: potencia(1 / base, -expoente)
  def potencia(base, expoente), do: base * potencia(base, expoente - 1)

  def fibonacci(0), do: 0
  def fibonacci(1), do: 1
  def fibonacci(n), do: fibonacci(n - 1) + fibonacci(n - 2)
end

# Versoes aceitando range de m ate n, onde [m;n]
defmodule Lista2Alternativa do
  def maior_venda(m, n) when n > m, do: Helper.maxi(Vendas.vendas(n), maior_venda(m, n - 1))
  def maior_venda(m, n) when n <= m, do: Vendas.vendas(m)

  def semana_max_venda(m, n) when n <= m, do: m

  def semana_max_venda(m, n) when n > m do
    cond do
      Lista2Alternativa.maior_venda(m, n) == Vendas.vendas(n) -> n
      true -> Lista2Alternativa.semana_max_venda(m, n - 1)
    end
  end

  def zero_vendas(m, n) when n < m, do: -1

  def zero_vendas(m, n) when n >= m do
    cond do
      Vendas.vendas(n) == 0 -> n
      true -> Lista2Alternativa.zero_vendas(m, n - 1)
    end
  end

  def acha_semana(_, m, n) when n < m, do: -1

  def acha_semana(s, m, n) when n >= m do
    cond do
      Vendas.vendas(n) == s -> n
      true -> Lista2Alternativa.acha_semana(s, m, n - 1)
    end
  end

  def zero_vendas2(m, n) do
    Lista2Alternativa.acha_semana(0, m, n)
  end
end
