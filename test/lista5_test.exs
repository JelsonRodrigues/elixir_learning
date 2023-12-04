defmodule Lista5Test do
  use ExUnit.Case
  doctest Lista5


  test "soma_tuplas" do
    assert Lista5.soma_tuplas({{0, 0}, {0, 1}}) == 1
    assert Lista5.soma_tuplas({{0, 1}, {0, 3}}) == 4
  end

  test "shift" do
    assert Lista5.shift({{1, 2}, 3}) == {1, {2, 3}}
    assert Lista5.shift({{true, "as"}, 3}) == {true, {"as", 3}}
  end

  test "min_e_max" do
    assert Lista5.min_e_max(1,2,3) == {1, 3}
    assert Lista5.min_e_max(1,2,1) == {1, 2}
    assert Lista5.min_e_max(1,1,1) == {1, 1}
  end

  test "soma_lista_tuplas" do
    assert Lista5.soma_lista_tuplas([]) == 0
    assert Lista5.soma_lista_tuplas([{1, 2}]) == 3
    assert Lista5.soma_lista_tuplas([{1, 2}, {1, 1}]) == 5
  end

  test "zip" do
    assert Lista5.zip([1,2,3], [1,2,3]) == [{1,1}, {2,2}, {3,3}]
    assert Lista5.zip([1,2], [1,2,3]) == [{1,1}, {2,2}]
    assert Lista5.zip([1], [1,2,3]) == [{1,1}]
    assert Lista5.zip([1,2,3,4], [1,2,3]) == [{1,1}, {2,2}, {3,3}]
  end

  test "zip_tres" do
    assert Lista5.zip_tres([1,2,3], [1,2,3], [1,2,3]) == [{1,1,1}, {2,2,2}, {3,3,3}]
    assert Lista5.zip_tres([1,2], [1,2,3], [1,2]) == [{1,1,1}, {2,2,2}]
    assert Lista5.zip_tres([1], [1,2,3], [3]) == [{1,1,3}]
    assert Lista5.zip_tres([1,2,3,4], [1,2,3], [1,2]) == [{1,1,1}, {2,2,2}]
  end

  test "unzip" do
    assert Lista5.unzip([]) == []
    assert Lista5.unzip([{1,2}, {1,2}]) == {[1,1], [2,2]}
    assert Lista5.unzip([{1,2}, {1,2}, {2,3}]) == {[1,1,2], [2,2,3]}
  end
end

defmodule ExemplosTuplaTest do
  use ExUnit.Case

  test "area" do
    assert ExemplosTupla.area({:quadrado, 4}) == 16
    assert ExemplosTupla.area({:quadrado, 0}) == 0
    assert ExemplosTupla.area({:retangulo, 4, 2}) == 8
    assert ExemplosTupla.area({:circulo, 1}) == :math.pi()
  end
end
