# lesson002a.exs

# This script should lead me towards concurrent programming.

defmodule SpawnMod do
  def hello1 do
    IO.puts "Hello 1"
  end
end

# This should work:
SpawnMod.hello1
