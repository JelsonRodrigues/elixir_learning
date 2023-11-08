defmodule Exemplos do
  def fatorial(0), do: 1
  def fatorial(n), do: n * fatorial(n-1)
end

defmodule Vendas do
  def vendas(0), do: 33
  def vendas(1), do: 22
  def vendas(3), do: 0
  def vendas(4), do: 66
  def vendas(5), do: 0
  def vendas(_), do: 22
  def venda_total(0), do: vendas(0)
  def venda_total(n), do: vendas(n) + venda_total(n-1)
end

defmodule Lista2 do
  def maxi(x,y) do
    cond do
      x>=y -> x
      y>=x -> y
    end
  end

  def maior_venda(0), do: Vendas.vendas(0)
  def maior_venda(n), do: Lista2.maxi(Vendas.vendas(n), maior_venda(n-1))

  def semana_max_venda(0), do: 0
  def semana_max_venda(n) do
    cond do
      Lista2.maior_venda(n) == Vendas.vendas(n) -> n
      true -> Lista2.semana_max_venda(n-1)
    end
  end

  def zero_vendas(n) do
    cond do
      n < 0 -> -1
      Vendas.vendas(n) == 0 -> n
      true -> Lista2.zero_vendas(n-1)
    end
  end

  def acha_semana(s, n) do
    cond do
      n < 0 -> -1
      Vendas.vendas(n) == s -> n
      true -> acha_semana(s, n-1)
    end
  end

  def zero_vendas2(n) do
    Lista2.acha_semana(0, n)
  end

  # Versoes aceitando range de m ate n, onde [m;n]
  def maior_venda2(m, n) when n > m, do: Lista2.maxi(Vendas.vendas(n), maior_venda2(m, n-1))
  def maior_venda2(m, n) when n <= m, do: Vendas.vendas(m)

  def semana_max_venda2(m, n) when n <= m, do: m
  def semana_max_venda2(m, n) when n > m do
    cond do
      Lista2.maior_venda2(m, n) == Vendas.vendas(n) -> n
      true -> Lista2.semana_max_venda2(m, n-1)
    end
  end

  # def zero_vendas(n) do
  #   cond do
  #     n < 0 -> -1
  #     Vendas.vendas(n) == 0 -> n
  #     true -> Lista2.zero_vendas(n-1)
  #   end
  # end

  # def acha_semana(s, n) do
  #   cond do
  #     n < 0 -> -1
  #     Vendas.vendas(n) == s -> n
  #     true -> acha_semana(s, n-1)
  #   end
  # end

  # def zero_vendas2(n) do
  #   Lista2.acha_semana(0, n)
  # end

end
