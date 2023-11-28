defmodule Lista4Test do
  use ExUnit.Case
  doctest Lista4

  test "membro" do
    assert Lista4.membro([], 1) == false
    assert Lista4.membro([1], 2) == false
    assert Lista4.membro([1], 1) == true
    assert Lista4.membro([1,4,2], 4) == true
    assert Lista4.membro([1,4,2,9,0], 0) == true
    assert Lista4.membro([1,4,2,9,0], -1) == false
  end

  test "quantas_vezes" do
    assert Lista4.quantas_vezes([], 0) == 0
    assert Lista4.quantas_vezes([0], 0) == 1
    assert Lista4.quantas_vezes([0, 9], 2) == 0
    assert Lista4.quantas_vezes([0, 9, 0, 9, 2, 4, 5], 2) == 1
    assert Lista4.quantas_vezes([0, 9, 0, 9, 2, 4, 5], 9) == 2
    assert Lista4.quantas_vezes([7,7,7], 7) == 3
  end

  test "membro_alternativa" do
    assert Lista4.membro_alternativa([], 1) == false
    assert Lista4.membro_alternativa([1], 2) == false
    assert Lista4.membro_alternativa([1], 1) == true
    assert Lista4.membro_alternativa([1,4,2], 4) == true
    assert Lista4.membro_alternativa([1,4,2,9,0], 0) == true
    assert Lista4.membro_alternativa([1,4,2,9,0], -1) == false
  end

  test "unicos" do
    assert Lista4.unicos([]) == []
    assert Lista4.unicos([1]) == [1]
    assert Lista4.unicos([1,2]) == [1,2]
    assert Lista4.unicos([1,2,2]) == [1,2]
    assert Lista4.unicos([1,1,1,3,2,1]) == [3,2,1]
  end

  test "quick_sort" do
    assert Lista4.quick_sort([]) == []
    assert Lista4.quick_sort([1]) == [1]
    assert Lista4.quick_sort([4,1,6,2]) == [1,2,4,6]
    assert Lista4.quick_sort([4,2,1,6,2]) == [1,2,2,4,6]
  end
end



defmodule ExemplosSortTest do
  use ExUnit.Case

  test "insertion_sort" do
    assert ExemplosSort.insertion_sort([]) == []
    assert ExemplosSort.insertion_sort([1,3,2]) == [1,2,3]
    assert ExemplosSort.insertion_sort([1]) == [1]
    assert ExemplosSort.insertion_sort([1,5,10]) == [1,5,10]
    assert ExemplosSort.insertion_sort([1,3,2,5,0]) == [0,1,2,3,5]
  end

  test "menor_com_insertion_sort" do
    assert ExemplosSort.menor([1]) == 1
    assert ExemplosSort.menor([2,1]) == 1
  end

  test "maior_com_insertion_sort" do
    assert ExemplosSort.maior([1]) == 1
    assert ExemplosSort.maior([2,1]) == 2
  end

  test "insertion_sort_remove_duplicates" do
    assert ExemplosSort.insertion_sort_remove_duplicates([]) == []
    assert ExemplosSort.insertion_sort_remove_duplicates([1,1]) == [1]
    assert ExemplosSort.insertion_sort_remove_duplicates([3,3,2,1]) == [1,2,3]
  end

  test "insertion_sort_reverse" do
    assert ExemplosSort.insertion_sort_reverse([]) ==[]
    assert ExemplosSort.insertion_sort_reverse([1,2]) ==[2,1]
    assert ExemplosSort.insertion_sort_reverse([1]) ==[1]
    assert ExemplosSort.insertion_sort_reverse([3,3,2,3,1]) ==[3,3,3,2,1]
  end
end
