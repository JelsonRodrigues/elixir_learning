defmodule Lista2Test do
  use ExUnit.Case
  doctest Lista2

  test "maxi" do
    assert Helper.maxi(1, 9) == 9
    assert Helper.maxi(313, 9) == 313
    assert Helper.maxi(0, 0) == 0
    assert Helper.maxi(-1, -5) == -1
  end

  test "maior_venda" do
    assert Lista2.maior_venda(0) == 33
    assert Lista2.maior_venda(1) == 33
    assert Lista2.maior_venda(4) == 66
    assert Lista2.maior_venda(10) == 66
  end

  test "semana_max_venda" do
    assert Lista2.semana_max_venda(0) == 0
    assert Lista2.semana_max_venda(1) == 0
    assert Lista2.semana_max_venda(3) == 0
    assert Lista2.semana_max_venda(4) == 4
    assert Lista2.semana_max_venda(5) == 4
    assert Lista2.semana_max_venda(10) == 4
  end

  test "zero_vendas" do
    assert Lista2.zero_vendas(-1) == -1
    assert Lista2.zero_vendas(0) == -1
    assert Lista2.zero_vendas(1) == -1
    assert Lista2.zero_vendas(4) == 3
    assert Lista2.zero_vendas(5) == 5
  end

  test "acha_semana" do
    assert Lista2.acha_semana(0, -1) == -1
    assert Lista2.acha_semana(0, 0) == -1
    assert Lista2.acha_semana(0, 1) == -1
    assert Lista2.acha_semana(0, 3) == 3
    assert Lista2.acha_semana(33, 4) == 0
  end

  test "zero_vendas2" do
    assert Lista2.zero_vendas2(-1) == -1
    assert Lista2.zero_vendas2(0) == -1
    assert Lista2.zero_vendas2(1) == -1
    assert Lista2.zero_vendas2(4) == 3
    assert Lista2.zero_vendas2(5) == 5
  end

  test "maior_venda_alternativa" do
    assert Lista2Alternativa.maior_venda(0, 0) == 33
    assert Lista2Alternativa.maior_venda(0, 1) == 33
    assert Lista2Alternativa.maior_venda(0, 4) == 66
    assert Lista2Alternativa.maior_venda(0, 10) == 66
    assert Lista2Alternativa.maior_venda(1, 3) == 22
    assert Lista2Alternativa.maior_venda(2, 4) == 66
    assert Lista2Alternativa.maior_venda(4, 9) == 66
    assert Lista2Alternativa.maior_venda(5, 8) == 22
    assert Lista2Alternativa.maior_venda(5, 5) == 0
  end

  test "semana_max_venda_alternativa" do
    assert Lista2Alternativa.semana_max_venda(0, 0) == 0
    assert Lista2Alternativa.semana_max_venda(0, 1) == 0
    assert Lista2Alternativa.semana_max_venda(0, 3) == 0
    assert Lista2Alternativa.semana_max_venda(0, 4) == 4
    assert Lista2Alternativa.semana_max_venda(0, 5) == 4
    assert Lista2Alternativa.semana_max_venda(0, 10) == 4
    assert Lista2Alternativa.semana_max_venda(1, 3) == 2
    assert Lista2Alternativa.semana_max_venda(2, 4) == 4
    assert Lista2Alternativa.semana_max_venda(4, 9) == 4
    assert Lista2Alternativa.semana_max_venda(5, 8) == 8
    assert Lista2Alternativa.semana_max_venda(3, 3) == 3
  end

  test "zero_vendas_alternativa" do
    assert Lista2Alternativa.zero_vendas(0, 0) == -1
    assert Lista2Alternativa.zero_vendas(0, 1) == -1
    assert Lista2Alternativa.zero_vendas(0, 3) == 3
    assert Lista2Alternativa.zero_vendas(4, 7) == 5
    assert Lista2Alternativa.zero_vendas(9, 7) == -1
    assert Lista2Alternativa.zero_vendas(9, 3) == -1
  end

  test "acha_seman_alternativa" do
    assert Lista2Alternativa.acha_semana(0, 0, 0) == -1
    assert Lista2Alternativa.acha_semana(0, 0, 1) == -1
    assert Lista2Alternativa.acha_semana(0, 0, 3) == 3
    assert Lista2Alternativa.acha_semana(0, 4, 7) == 5
    assert Lista2Alternativa.acha_semana(0, 9, 7) == -1
    assert Lista2Alternativa.acha_semana(66, 5, 8) == -1
    assert Lista2Alternativa.acha_semana(66, 4, 8) == 4
    assert Lista2Alternativa.acha_semana(22, 7, 10) == 10
  end

  test "zero_vendas2_alternativo" do
    assert Lista2Alternativa.zero_vendas2(0, -1) == -1
    assert Lista2Alternativa.zero_vendas2(0, 0) == -1
    assert Lista2Alternativa.zero_vendas2(0, 1) == -1
    assert Lista2Alternativa.zero_vendas2(0, 4) == 3
    assert Lista2Alternativa.zero_vendas2(0, 5) == 5
    assert Lista2Alternativa.zero_vendas2(0, 5) == 5
    assert Lista2Alternativa.zero_vendas2(3, 5) == 5
    assert Lista2Alternativa.zero_vendas2(3, 4) == 3
  end

  test "multiplica_no_intervalo" do
    assert Lista2.multiplica_no_intervalo(1, 1) == 1
    assert Lista2.multiplica_no_intervalo(1, 2) == 2
    assert Lista2.multiplica_no_intervalo(1, 3) == 6
    assert Lista2.multiplica_no_intervalo(1, 4) == 24
    assert Lista2.multiplica_no_intervalo(5, 8) == 1680
    assert Lista2.multiplica_no_intervalo(0, 8) == 0
  end

  test "potencia" do
    assert Lista2.potencia(0, 1) == 0
    assert Lista2.potencia(1, 1) == 1
    assert Lista2.potencia(2, 1) == 2
    assert Lista2.potencia(2, 2) == 4
    assert Lista2.potencia(5, -1) == 1/5
    assert Lista2.potencia(5, -2) == (1/5) ** 2
    assert Lista2.potencia(-3, 2) == 9
    assert Lista2.potencia(-3, 3) == -27
    assert Lista2.potencia(0, 0) == 1
  end

  test "fibonacci" do
    assert Lista2.fibonacci(0) == 0
    assert Lista2.fibonacci(1) == 1
    assert Lista2.fibonacci(2) == 1
    assert Lista2.fibonacci(3) == 2
    assert Lista2.fibonacci(4) == 3
    assert Lista2.fibonacci(5) == 5
  end
end
