defmodule PlusOne do
  def solution(input) do
    do_first(Enum.reverse(input))
  end

  defp do_first([]), do: []
  defp do_first([first | rest]) when first == 9, do: do_rest(rest, true, [0])
  defp do_first([first | rest]), do: do_rest(rest, false, [first + 1])

  defp do_rest([], _carry = true, acc), do: [1 | acc]
  defp do_rest([], _carry = false, acc), do: acc

  defp do_rest([h | t], _carry = true, acc) when h == 9, do: do_rest(t, true, [0 | acc])
  defp do_rest([h | t], _carry = true, acc), do: do_rest(t, false, [h + 1 | acc])
  defp do_rest([h | t], _carry = false, acc), do: do_rest(t, false, [h | acc])
end
