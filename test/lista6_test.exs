defmodule Lista6Test do
  use ExUnit.Case
  doctest Lista6

  test "aplica_duas_vezes" do
    assert Lista6.aplica_duas_vezes(0, &(&1 + 1)) == 2
    assert Lista6.aplica_duas_vezes(-1, fn x -> x * x end) == 1
  end

  test "iter" do
    assert Lista6.iter(&(&1 + 1), 0, 0) == 0
    assert Lista6.iter(&(&1 + 1), 2, 0) == 2
    assert Lista6.iter(&(&1 * &1), 2, 2) == 16
  end

  test "filter" do
    assert Lista6.filter([], & &1) == []
    assert Lista6.filter([1, 2, 3, 4], &(rem(&1, 2) == 0)) == [2, 4]
    assert Lista6.filter([1, 2, 3, 4], &(&1 > 3)) == [4]
  end

  test "foldl" do
    assert Lista6.foldl([], &(&1 + &2), 0) == 0
    assert Lista6.foldl([1, 2, 3], &(&1 + &2), 0) == 6
    assert Lista6.foldl([1, 2, 3], &(&1 * &2), 1) == 6
    assert Lista6.foldl([1, 2, 3], &(&1 * &2), 0) == 0
  end

  test "foldr" do
    assert Lista6.foldr([], &(&1 + &2), 0) == 0
    assert Lista6.foldr([1, 2, 3], &(&1 + &2), 0) == 6
    assert Lista6.foldr([1, 2, 3], &(&1 * &2), 1) == 6
    assert Lista6.foldr([1, 2, 3], &(&1 * &2), 0) == 0
  end

  test "concatena" do
    assert Lista6.concatena([]) == []
    assert Lista6.concatena([[1]]) == [1]
    assert Lista6.concatena([[1], [2, 3]]) == [2, 3, 1]
    assert Lista6.concatena([[1], [2, 3], [4, 5]]) == [2, 3, 4, 5, 1]
  end

  test "soma_quadrados_positivos" do
    assert Lista6.soma_quad_positivos([]) == 0
    assert Lista6.soma_quad_positivos([-1, 2]) == 4
    assert Lista6.soma_quad_positivos([-1]) == 0
    assert Lista6.soma_quad_positivos([-1, 1, -9, 1, -5, 2]) == 6
  end

  test "conta_elementos" do
    assert Lista6.conta_elementos([]) == 0
    assert Lista6.conta_elementos([2]) == 1
    assert Lista6.conta_elementos([2, True, :ok, "Hello"]) == 4
  end

  test "conta_neg" do
    assert Lista6.conta_neg([]) == 0
    assert Lista6.conta_neg([2]) == 0
    assert Lista6.conta_neg([2, -2]) == 1
    assert Lista6.conta_neg([2, -2, 0]) == 1
    assert Lista6.conta_neg([2, -2, -8]) == 2
  end

  test "soma_listas" do
    assert Lista6.soma_listas([[1], [2], [3]]) == 6
    assert Lista6.soma_listas([[1, 1, 1], [2, 2, 2], [3, 3, 3]]) == 18
  end
end
