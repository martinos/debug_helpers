defmodule DebugHelpers do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      worker(DebugHelpers.Server, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DebugHelpers.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def debug(data, msg \\ "DEBUG") do
    DebugHelpers.Helpers.debug(data, msg)
  end

  def diff(data, msg \\ "DEBUG") do
    DebugHelpers.Helpers.diff(data, msg)
  end
end
