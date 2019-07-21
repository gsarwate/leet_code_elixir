defmodule TwoStackQ do
  use GenServer

  # Client

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def push(item) do
    GenServer.cast(__MODULE__, {:push, item})
  end

  def empty?() do
    GenServer.call(__MODULE__, {:empty?})
  end

  def peek() do
    GenServer.call(__MODULE__, {:peek})
  end

  def pop() do
    GenServer.call(__MODULE__, {:pop})
  end

  def stop() do
    GenServer.stop(__MODULE__)
  end

  # Server (callbacks)

  @impl true
  def init(_) do
    {:ok, {[], []}}
  end

  @impl true
  def handle_cast({:push, item}, state) do
    {inbox, outbox} = state
    new_inbox = [item | inbox]
    {:noreply, {new_inbox, outbox}}
  end

  @impl true
  def handle_call({:empty?}, _from, state) do
    is_empty =
      case state do
        {[], []} -> true
        _ -> false
      end

    {:reply, is_empty, state}
  end

  @impl true
  def handle_call({:peek}, _from, state) do
    {inbox, outbox} = state
    {new_inbox, new_outbox} = check_outbox(inbox, outbox)

    item =
      case length(new_outbox) do
        0 -> nil
        _ -> List.first(new_outbox)
      end

    {:reply, item, {new_inbox, new_outbox}}
  end

  @impl true
  def handle_call({:pop}, _from_, state) do
    {inbox, outbox} = state
    {new_inbox, new_outbox} = check_outbox(inbox, outbox)

    {result, ob} =
      case length(new_outbox) do
        0 -> {nil, []}
        _ -> do_pop(new_outbox)
      end

    {:reply, result, {new_inbox, ob}}
  end

  defp check_outbox([], []), do: {[], []}
  defp check_outbox(inbox, outbox = []), do: move_to_outbox(inbox, outbox)
  defp check_outbox(inbox, outbox), do: {inbox, outbox}

  defp move_to_outbox([], outbox), do: {[], outbox}
  defp move_to_outbox([h | t], outbox), do: move_to_outbox(t, [h | outbox])

  defp do_pop([h | t]), do: {h, t}
end
