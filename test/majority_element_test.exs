defmodule MajorityElementTest do
  use ExUnit.Case

  test "test 1" do
    list = [3, 2, 3]
    assert MajorityElement.majority(list) == 3
  end

  test "test 2" do
    list = [2, 2, 1, 1, 1, 2, 2]
    assert MajorityElement.majority(list) == 2
  end

  test "test 3" do
    list = []
    assert MajorityElement.majority(list) == 0
  end

  test "test 4" do
    list = [-1, 4, 2, -1, 6, -1, 7, -1]
    assert MajorityElement.majority(list) == -1
  end

  test "test 5" do
    list = [4, 4, 4, 4, 4]
    assert MajorityElement.majority(list) == 4
  end
end
