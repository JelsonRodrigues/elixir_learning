defmodule Prova1 do
  def numero_negativos([]), do: 0

  def numero_negativos([h | t]) do
    cond do
      h < 0 -> 1 + numero_negativos(t)
      true -> numero_negativos(t)
    end
  end

  def mult_tupla([]), do: []
  def mult_tupla([{e1, e2} | t]), do: [e1 * e2 | mult_tupla(t)]

  def drop(_n, []), do: []
  def drop(0, [h | t]), do: [h | t]
  def drop(n, [_h | t]) when n > 0, do: drop(n - 1, t)

  def get_list(0, [h | _t]), do: h
  def get_list(n, [_h | t]) when n > 0, do: get_list(n - 1, t)

  def min([h | t]), do: _min(h, t)
  defp _min(cur_min, []), do: cur_min

  defp _min(cur_min, [h | t]) do
    cond do
      h < cur_min -> _min(h, t)
      true -> _min(cur_min, t)
    end
  end
end
