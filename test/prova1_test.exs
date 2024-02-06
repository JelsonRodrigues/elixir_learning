defmodule Prova1Test do
  use ExUnit.Case
  doctest Prova1

  test "numero_negativos" do
    assert Prova1.numero_negativos([]) == 0
    assert Prova1.numero_negativos([1, 2]) == 0
    assert Prova1.numero_negativos([1, 2, -1]) == 1
  end

  test "mult_tupla" do
    assert Prova1.mult_tupla([{1, 1}, {1, 2}]) == [1, 2]
    assert Prova1.mult_tupla([{1, 1}, {1, 2}, {2, 2}]) == [1, 2, 4]
  end

  test "drop" do
    assert Prova1.drop(0, []) == []
    assert Prova1.drop(0, [1, 2]) == [1, 2]
    assert Prova1.drop(1, [1, 2]) == [2]
  end

  test "get_list" do
    assert Prova1.get_list(0, [1]) == 1
    assert Prova1.get_list(0, [1, 2]) == 1
    assert Prova1.get_list(1, [0, 1, 2]) == 1
  end

  test "min" do
    assert Prova1.min([1, 2, 3]) == 1
    assert Prova1.min([1, 2, -1, 3]) == -1
  end
end
