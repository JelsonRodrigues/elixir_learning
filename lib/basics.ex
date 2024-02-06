defmodule Basics do
  def maior_de_idade(idade) do
    idade >= 18
  end

  def soma(a, b) do
    a + b
  end

  def menor(a, b) do
    cond do
      a >= b -> b
      b > a -> a
    end
  end

  def menor_alt(a, b) do
    if a >= b do
      b
    else
      a
    end
  end

  def par?(valor) do
    rem(valor, 2) == 0
  end

  # usando cond
  def par1?(valor) do
    cond do
      rem(valor, 2) == 0 -> true
      true -> false
    end
  end

  # usando if, else
  def par2?(valor) do
    if rem(valor, 2) == 0 do
      true
    else
      false
    end
  end

  def par3?(valor), do: rem(valor, 2) == 0

  def menor1(x, y) when x <= y do
    x
  end

  def menor1(x, y) when y <= x do
    y
  end

  def tres_iguais?(x, y, z), do: x == y && x == z
end
