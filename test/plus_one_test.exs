defmodule PlusOneTest do
  use ExUnit.Case

  test "123" do
    assert [1, 2, 4] = PlusOne.solution([1, 2, 3])
  end

  test "4321" do
    assert [4, 3, 2, 2] = PlusOne.solution([4, 3, 2, 1])
  end

  test "239" do
    assert [2, 4, 0] = PlusOne.solution([2, 3, 9])
  end

  test "9999" do
    assert [1, 0, 0, 0, 0] = PlusOne.solution([9, 9, 9, 9])
  end

  test "empty" do
    assert [] = PlusOne.solution([])
  end

  test "1" do
    assert [2] = PlusOne.solution([1])
  end

  test "9" do
    assert [1, 0] = PlusOne.solution([9])
  end
end
