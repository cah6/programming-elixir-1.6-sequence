defmodule Sequence.Server do
  use GenServer

  @spec init(any) :: {:ok, any}
  def init(xs) do
    {:ok, xs}
  end

  def handle_call(:pop, _from, [x | xs]) do
    {:reply, x, xs}
  end
end
