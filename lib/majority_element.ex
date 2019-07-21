defmodule MajorityElement do
  def majority(list) do
    do_work(list, {0, 0})
  end

  defp do_work([], {majority, _count}), do: majority

  defp do_work([next_element | t], {majority, count}) do
    {new_majority, new_count} =
      case count do
        0 -> {next_element, count + 1}
        _ -> {next_element, majority_count(majority, count, next_element)}
      end

    do_work(t, {new_majority, new_count})
  end

  defp majority_count(majority, count, element) when majority == element, do: count + 1
  defp majority_count(_majority, count, _element), do: count - 1
end
