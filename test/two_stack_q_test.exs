defmodule TwoStackQTest do
  use ExUnit.Case

  test "all" do
    TwoStackQ.start_link()

    assert TwoStackQ.empty?()
    refute TwoStackQ.peek()

    TwoStackQ.push(21)
    refute TwoStackQ.empty?()
    assert TwoStackQ.peek() == 21

    TwoStackQ.push(22)
    assert TwoStackQ.peek() == 21
    assert TwoStackQ.pop() == 21
    assert TwoStackQ.peek() == 22
    assert TwoStackQ.pop() == 22

    refute TwoStackQ.pop()
    refute TwoStackQ.peek()

    TwoStackQ.stop()
  end
end
