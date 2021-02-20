defmodule Sequence.Stash do
  use GenServer

  @me __MODULE__

  def start_link(st) do
    GenServer.start_link(__MODULE__, st, name: @me)
  end

  def get() do
    GenServer.call(@me, {:get})
  end

  def update(new_st) do
    GenServer.cast(@me, {:update, new_st})
  end

  # Server impl

  def init(st) do
    {:ok, st}
  end

  def handle_call({:get}, _from, st) do
    {:reply, st, st}
  end

  def handle_cast({:update, new_st}, _st) do
    {:noreply, new_st}
  end
end
