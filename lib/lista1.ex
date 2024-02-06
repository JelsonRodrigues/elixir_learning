defmodule Lista1 do
  def quatro_iguais?(a, b, c, d), do: a == b && c == d && a == c

  def quantos_iguais(a, b, c) do
    cond do
      a == b && a == c -> 3
      a == b || b == c -> 2
      true -> 0
    end
  end

  def todos_diferentes?(a, b, c), do: Lista1.quantos_iguais(a, b, c) == 0

  def tres_iguais?(a, b, c), do: a == b && a == c

  def quantos_iguais2(a, b, c) do
    cond do
      Lista1.tres_iguais?(a, b, c) -> 3
      Lista1.todos_diferentes?(a, b, c) -> 0
      true -> 2
    end
  end

  def quadrado(valor), do: valor * valor

  def quarta_potencia(valor), do: Lista1.quadrado(valor) * Lista1.quadrado(valor)

  def palindromo?(string), do: String.reverse(string) == string

  def verifica_triangulo?(a, b, c) do
    a + b > c &&
      a + c > b &&
      c + b > a
  end

  def sinal(numero) do
    cond do
      numero < 0 -> -1
      true -> 0
    end
  end

  def menor(a, b) do
    cond do
      a < b -> a
      true -> b
    end
  end

  def menor_tres(a, b, c), do: Lista1.menor(Lista1.menor(a, b), c)
end
