# lesson002b.ex

# This script should lead me towards concurrent programming.
# Demo:
# elixirc lesson002b.ex
# ls -l *.beam
# elixir -e "Elixir.SpawnMod.hello2"

defmodule SpawnMod do
  def hello2 do
    IO.puts "Hello 2"
  end
end

