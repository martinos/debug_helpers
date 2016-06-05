# DebugHelpers

Helpers for debugging Elixir application. Based on Elm's `Debug.log` function. 

You can use it this way:

    conn |> DebugHelpers.Helpers.debug("My Connection")

It will output in red the "My Connection" message followed by the inspected connection output in blue.

It pimps the famous `IO.inspect` function.

I will also output the elapsed time since the last the debug function was used. Great for quickly profiling


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add debug_helpers to your list of dependencies in `mix.exs`:

        def deps do
          [{:debug_helpers, github: "martinos/debug__helpers"}]
        end

  2. Ensure debug_helpers is started before your application:

        def application do
          [applications: [:debug_helpers]]
        end

