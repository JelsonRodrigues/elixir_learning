defmodule MineSweeperTest do
  use ExUnit.Case
  doctest MineSweeper

  import MineSweeper

  @test_tab [
    [1, 3, 2],
    [0, 0, 0],
    [1, 9, 2]
  ]

  @tab [
    ["-", "-", "-"],
    [2, "-", "-"],
    ["-", "-", "-"]
  ]

  @minas [
    [true, false, false],
    [false, false, false],
    [false, true, false]
  ]

  test "get_arr" do
    assert get_arr([1, 3, 2], 0) == 1
    assert get_arr([1, 3, 2], 1) == 3
    assert get_arr([1, 3, 2], 2) == 2
    assert get_arr(@test_tab, 0) == [1, 3, 2]
    assert get_arr(@test_tab, 0) |> get_arr(2) == 2
  end

  test "update_arr" do
    assert update_arr([0, 2, 1], 1, 9) == [0, 9, 1]

    assert update_arr(@test_tab, 1, 9) == [
             [1, 3, 2],
             9,
             [1, 9, 2]
           ]

    assert update_arr([0, 0, 0], 0, 1) == [1, 0, 0]

    assert update_arr(@test_tab, 1, update_arr(get_arr(@test_tab, 1), 2, 10)) == [
             [1, 3, 2],
             [0, 0, 10],
             [1, 9, 2]
           ]
  end

  test "get_pos" do
    assert get_pos(@test_tab, 1, 1) == 0
    assert get_pos(@test_tab, 2, 1) == 9
    assert get_pos(@minas, 0, 0) == true
  end

  test "update_pos" do
    assert update_pos(@test_tab, 0, 1, 88) == [
             [1, 88, 2],
             [0, 0, 0],
             [1, 9, 2]
           ]

    assert update_pos(@minas, 0, 0, false)
           |> update_pos(0, 1, true) == [
             [false, true, false],
             [false, false, false],
             [false, true, false]
           ]
  end

  test "is_mine?" do
    assert is_mine?(@minas, 0, 0) == true
    assert is_mine?(@minas, 0, 1) == false
    assert is_mine?(@minas, 2, 0) == false
  end

  test "is_valid_pos" do
    tamanho = length(@test_tab)
    assert is_valid_pos?(tamanho, 1, 1) == true
    assert is_valid_pos?(tamanho, -1, 1) == false
    assert is_valid_pos?(tamanho, 0, 1) == true
    assert is_valid_pos?(tamanho, 3, 3) == false
    assert is_valid_pos?(tamanho, 0, 0) == true
    assert is_valid_pos?(tamanho, 0, 3) == false
  end

  test "gen_adjacent_pos" do
    assert gen_adjacent_pos(0, 0) --
             [{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {0, 0}, {1, -1}, {1, 0}, {1, 1}] == []
  end

  test "valid_moves" do
    assert valid_moves(3, 0, 0) -- [{0, 1}, {1, 0}, {1, 1}] == []

    assert valid_moves(3, 1, 1) --
             [{0, 0}, {0, 1}, {0, 2}, {1, 0}, {1, 2}, {2, 0}, {2, 1}, {2, 2}] == []
  end

  test "conta_minas_adj" do
    assert conta_minas_adj(@minas, 0, 0) == 0
    assert conta_minas_adj(@minas, 1, 1) == 2
    assert conta_minas_adj(@minas, 1, 2) == 1
  end

  @tag timeout: :infinity
  test "abre_jogada" do
    assert abre_jogada(0, 0, @minas, @tab) == @tab
    assert abre_jogada(0, 1, @minas, @tab) == [["-", 1, "-"], [2, "-", "-"], ["-", "-", "-"]]
    assert abre_jogada(1, 1, @minas, @tab) == [["-", "-", "-"], [2, 2, "-"], ["-", "-", "-"]]
    assert abre_jogada(2, 2, @minas, @tab) == [["-", "-", "-"], [2, "-", "-"], ["-", "-", 1]]
    assert abre_jogada(2, 1, @minas, @tab) == @tab
    assert abre_jogada(0, 0, @minas, @tab) == @tab
    assert abre_jogada(0, 2, @minas, @tab) == [["-", 1, 0], [2, 2, 1], ["-", "-", "-"]]

    mines = [
      [false, false, false, false, false],
      [false, false, true, false, true],
      [false, false, false, false, true],
      [false, false, false, false, false],
      [false, false, false, true, false]
    ]

    tab = [
      ["-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-"]
    ]

    assert abre_jogada(0, 0, mines, tab) == [
             [0, 1, "-", "-", "-"],
             [0, 1, "-", "-", "-"],
             [0, 1, 1, "-", "-"],
             [0, 0, 1, "-", "-"],
             [0, 0, 1, "-", "-"]
           ]

    assert abre_jogada(3, 3, mines, abre_jogada(0, 0, mines, tab)) == [
             [0, 1, "-", "-", "-"],
             [0, 1, "-", "-", "-"],
             [0, 1, 1, "-", "-"],
             [0, 0, 1, 2, "-"],
             [0, 0, 1, "-", "-"]
           ]
  end

  test "abre_posicao" do
    assert abre_posicao(@tab, @minas, 0, 0) == [["*", "-", "-"], [2, "-", "-"], ["-", "-", "-"]]

    assert abre_posicao(@tab, @minas, 0, 0) |> abre_posicao(@minas, 2, 1) == [
             ["*", "-", "-"],
             [2, "-", "-"],
             ["-", "*", "-"]
           ]

    assert abre_posicao(@tab, @minas, 0, 0)
           |> abre_posicao(@minas, 2, 1)
           |> abre_posicao(@minas, 0, 1) == [["*", 1, "-"], [2, "-", "-"], ["-", "*", "-"]]

    assert abre_posicao(@tab, @minas, 0, 1) == [["-", 1, "-"], [2, "-", "-"], ["-", "-", "-"]]
    assert abre_posicao(@tab, @minas, 1, 1) == [["-", "-", "-"], [2, 2, "-"], ["-", "-", "-"]]
  end

  test "abre_tabuleiro" do
    assert abre_tabuleiro(@minas, @tab) == [["*", 1, 0], [2, 2, 1], [1, "*", 1]]
  end

  test "board_to_string" do
    assert board_to_string(@tab) == " - - -\n 2 - -\n - - -\n"
    assert board_to_string(abre_posicao(@tab, @minas, 0, 0)) == " * - -\n 2 - -\n - - -\n"
    assert board_to_string(abre_tabuleiro(@minas, @tab)) == " * 1 0\n 2 2 1\n 1 * 1\n"
  end

  test "gera_lista" do
    assert gera_lista(3, true) == [true, true, true]
    assert gera_lista(2, 2.0) == [2.0, 2.0]
    assert gera_lista(2, gera_lista(2, false)) == [[false, false], [false, false]]
  end

  test "gera_tabuleiro" do
    assert gera_tabuleiro(4) == [
             ["-", "-", "-", "-"],
             ["-", "-", "-", "-"],
             ["-", "-", "-", "-"],
             ["-", "-", "-", "-"]
           ]

    assert gera_tabuleiro(1) == [["-"]]
  end

  test "gera_mapa_de_minas" do
    assert gera_mapa_de_minas(2) == [[false, false], [false, false]]
  end

  test "conta_fechadas" do
    assert conta_fechadas(@tab) == 8
    assert abre_posicao(@tab, @minas, 1, 1) |> conta_fechadas() == 7
    assert abre_posicao(@tab, @minas, 1, 1) |> abre_posicao(@minas, 1, 2) |> conta_fechadas() == 6
    assert abre_tabuleiro(@minas, @tab) |> conta_fechadas() == 0
  end

  test "conta_minas" do
    assert conta_minas(@minas) == 2
    assert update_pos(@minas, 0, 2, true) |> conta_minas() == 3
    assert gera_mapa_de_minas(4) |> conta_minas() == 0
  end
end
