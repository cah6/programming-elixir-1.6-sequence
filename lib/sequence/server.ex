defmodule Sequence.Server do
  use GenServer

  ### External API

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(x) do
    GenServer.cast(__MODULE__, {:push, x})
  end

  ### GenServer implementations

  def init(_) do
    {:ok, Sequence.Stash.get()}
  end

  def handle_call(:pop, _from, [x | xs]) do
    {:reply, x, xs}
  end

  def handle_cast({:push, x}, xs) do
    {:noreply, [x | xs]}
  end

  def terminate(_reason, st) do
    Sequence.Stash.update(st)
  end
end
