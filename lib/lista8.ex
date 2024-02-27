

defmodule Lista8 do
  def read_number(prompt) do
    {number, _rest_of_string} = IO.gets(prompt) |> String.trim |> Integer.parse
    number
  end

  def le_nome_endereco() do
    nome = IO.gets("Digite seu nome: ") |> String.trim
    endereco = IO.gets("Digite seu endereco: ") |> String.trim

    {nome, endereco}
  end

  def print_lista([]), do: IO.puts("Fim!")
  def print_lista([h|t]) do
    IO.puts(h)
    print_lista(t)
  end

  def le_n_numero_endereco(n) when n==0, do: []
  def le_n_numero_endereco(n) when n>0, do: [Lista8.le_nome_endereco() | Lista8.le_n_numero_endereco(n-1)]

  defp print_lista_posicoes_func([], _n) do
    IO.puts("Fim")
  end
  defp print_lista_posicoes_func([h|t], n) do
    IO.puts("[#{n}]: #{h}")
    Lista8.print_lista_posicoes_func(t, n+1)
  end

  def print_lista_posicoes(l), do: Lista8.print_lista_posicoes_func(l, 0)

  def maior_de_n(n) do
    highest = maior_de_n_p(n, 0)
    IO.puts("The highest number is #{highest}")
  end

  def maior_de_n_p(n, p) when n == 0, do: p
  def maior_de_n_p(n, p) when n > 0 do
    number = Lista8.read_number("Type a number: ")
    if number > p do
      maior_de_n_p(n-1, number)
    else
      maior_de_n_p(n-1, p)
    end
  end

  def print_nomes(n) when n > 0 do

  end

end
