defmodule Lista6Test do
  use ExUnit.Case
  doctest Lista6

  test "read_number" do
    input = " 8\n"

    assert Lista8.read_number(input, "") == 8
  end
end
