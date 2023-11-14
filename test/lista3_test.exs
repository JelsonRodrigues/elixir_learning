defmodule Lista3Test do
  use ExUnit.Case
  doctest Lista3

  test "mult_dois_lista" do
    assert Lista3.mult_dois_lista([]) == []
    assert Lista3.mult_dois_lista([0]) == [0]
    assert Lista3.mult_dois_lista([0, 4]) == [0, 8]
  end

  test "tamanho" do
    assert Lista3.tamanho([]) == 0
    assert Lista3.tamanho([-1]) == 1
    assert Lista3.tamanho([true, false, 1, "Jelson"]) == 4
  end

  test "produto_lista" do
    assert Lista3.produto_lista([1,2,3]) == 6
    assert Lista3.produto_lista([1,2,0]) == 0
    assert Lista3.produto_lista([]) == 0
    assert Lista3.produto_lista([1]) == 1
    # assert_raise Lista3.produto_lista([true, 1, "abc"])
  end

  test "and_lista" do
    assert Lista3.and_lista([1,1]) == 1
    assert Lista3.and_lista([]) == false
    assert Lista3.and_lista([1, 0, 8]) == 8
    assert Lista3.and_lista([true, false, true]) == false
  end

  test "insere_final" do
    assert Lista3.insere_final(true, []) == [true]
    assert Lista3.insere_final(true, ["Abc"]) == ["Abc", true]
    assert Lista3.insere_final(4, [1, 2, 3]) == [1, 2, 3, 4]
  end

  test "neg_lista" do
    assert Lista3.neg_lista([]) == []
    assert Lista3.neg_lista([true]) == [false]
    assert Lista3.neg_lista([true, false]) == [false, true]
  end

  test "join" do
    assert Lista3.join([], []) == []
    assert Lista3.join([], [1]) == [1]
    assert Lista3.join([1], [2]) == [1, 2]
    assert Lista3.join([2], []) == [2]
    assert Lista3.join([], [2, 3]) == [2, 3]
  end
end

defmodule ExemplosTest do
  use ExUnit.Case

  test "mostra_lista" do
    assert ExemplosLista.mostra_lista([1,2,3]) == :ok
  end
end
