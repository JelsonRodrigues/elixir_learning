defmodule Lista6Test do
  use ExUnit.Case
  doctest Lista6

  test "conta_positivos" do
    assert Lista7.conta_positivos([]) == 0
    assert Lista7.conta_positivos([1,2,3]) == 3
    assert Lista7.conta_positivos([1,2,3,-2,-9]) == 3
  end

  test "mais_de_cinco" do
    lista = [
      {"Camiseta", 8, 20.00},
      {"Mochila", 2, 120.00},
      {"Bone", 23, 15.00},
    ]
    assert Lista7.mais_de_cinco(lista) == [
      {"Camiseta", 8, 18.00},
      {"Bone", 23, 13.50},
    ]

    assert Lista7.mais_de_cinco([]) == []

  end

  test "lucro_loja" do
    lista = [
      {"Camiseta", 8, 20.00},
      {"Mochila", 2, 120.00},
      {"Bone", 23, 15.00},
    ]
    assert Lista7.lucro_loja(lista) ==  454.5
    assert Lista7.lucro_loja([]) == 0.0

  end

end
