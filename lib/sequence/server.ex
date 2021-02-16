defmodule Sequence.Server do
  use GenServer

  ### External API

  def start_link(xs) do
    GenServer.start_link(__MODULE__, xs, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(x) do
    GenServer.cast(__MODULE__, {:push, x})
  end

  ### GenServer implementations

  def init(xs) do
    {:ok, xs}
  end

  def handle_call(:pop, _from, [x | xs]) do
    {:reply, x, xs}
  end

  def handle_cast({:push, x}, xs) do
    {:noreply, [x | xs]}
  end
end
