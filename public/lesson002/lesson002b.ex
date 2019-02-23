# lesson002b.ex

# This script should lead me towards concurrent programming.
# Demo:
# elixirc lesson002b.ex
# elixir -e "Elixir.SpawnMod.hello1"

defmodule SpawnMod do
  def hello1 do
    IO.puts "Hello 1"
  end
end

# This should work:
SpawnMod.hello1
