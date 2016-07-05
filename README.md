# DebugHelpers

Helpers for debugging Elixir applications. Based on Elm's `Debug.log` function. 

You can use it this way:

    changeset |> DebugHelpers.Helpers.debug("index changeset")

This will output the "index changeset" message in red followed by the inspected connection output in blue.

It pimps the famous `IO.inspect` function.

This will also output the elapsed time since the last tine the debug function was used. This is great for quickly profiling

Here is a screen shot of an example output:

![](/docs/screen_shot.jpg)

## Installation

  1. Add debug_helpers to your list of dependencies in `mix.exs`:
  ```elixir
  def deps do
    [{:debug_helpers, github: "martinos/debug_helpers"}]
  end
  ```

  2. Ensure debug_helpers is started before your application:
  ```elixir
  def application do
    [applications: [:debug_helpers]]
  end
  ```

