defmodule Basics do
  def maior_de_idade(idade) do
    idade >= 18
  end

  def soma(a, b) do
    a+b
  end

  def menor(a, b) do
    cond do
      a >= b -> b
      b > a -> a
    end
  end

end
