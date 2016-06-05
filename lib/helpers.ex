defmodule DebugHelpers.Helpers do
  alias DebugHelpers.Server
  use Timex

  def debug(data, msg \\ "DEBUG") do
    now = Time.now
    {old_time, _} = Server.update_rec(now, data)
    elapsed = Time.diff(now, old_time)
    elapsed_str = :io_lib.format("~.03f", [timestamp_to_sec(elapsed)])
    IO.puts "#{IO.ANSI.red}#{msg} [#{elapsed_str} secs]: #{IO.ANSI.blue}#{inspect(data, pretty: true)}#{IO.ANSI.reset}"
    data
  end

  def diff(data, msg \\ "DEBUG") do
    now = Time.now
    {old_time, old_data} = Server.update_rec(now, data)
    elapsed = Time.diff(now, old_time)
    elapsed_str = :io_lib.format("~.03f", [timestamp_to_sec(elapsed)])
    IO.puts "#{IO.ANSI.red}#{msg} [#{elapsed_str} secs]: #{IO.ANSI.blue}#{inspect(data, pretty: true)}#{IO.ANSI.reset}"
    IO.puts "#{IO.ANSI.red}#{msg} #{diff_str(inspect(old_data, pretty: true) <> "\n", inspect(data, pretty: true) <> "\n")}#{IO.ANSI.reset()}"
    data
  end

  defp timestamp_to_sec({megasec, sec, microsec}) do
    megasec * 1000000.0 + sec + microsec * 0.000001
  end

  def diff_str(first_str, second_str) do
    Temp.track!

    {:ok, first_file_path} = Temp.open("first_file", &IO.binwrite(&1, first_str))
    IO.puts first_file_path

    {:ok, second_file_path} = Temp.open "second_file", &IO.binwrite(&1, second_str)
    IO.puts second_file_path

    {str, _} = System.cmd("opendiff", [first_file_path, second_file_path]) 

    # cleanup
    Temp.cleanup
    str
  end
end
