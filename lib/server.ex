defmodule DebugHelpers.Server do
  use Timex

  def start_link do
    Agent.start_link(fn -> {Time.now, ""} end, name: __MODULE__)
  end

  def update_rec(now, data) do
    Agent.get_and_update(__MODULE__, fn {old_time, old_data} ->
      {{old_time, old_data}, {now, data}}
    end)
  end
end
