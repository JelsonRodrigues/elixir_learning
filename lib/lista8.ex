

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

  def ordena_nomes(n) when n > 0 do
    nomes = quick_sort(ler_nome_caller(n))
    mostra_nomes(nomes)
  end

  def mostra_nomes([]), do: IO.puts("Fim!")
  def mostra_nomes([h|t]) do
    IO.puts(h)
    mostra_nomes(t)
  end

  def ler_nome_caller(n) when n > 0, do: ler_nome(n, 1)
  def ler_nome(n, _index) when n==0, do: []
  def ler_nome(n, index) when n>0 do
    nome = IO.gets("Nome #{index}: ") |> String.trim
    [nome | Lista8.ler_nome(n-1, index + 1)]
  end

  def quick_sort([]), do: []
  def quick_sort([h|t]) do
    maiores = Enum.filter(t, fn x -> x > h end)
    menores = Enum.filter(t, fn x -> x < h end)
    quick_sort(menores) ++ [h] ++ quick_sort(maiores)
  end
end
