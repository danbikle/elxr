# hw3n.ex

# This script should:
# have a module that holds two functions.
# Below the module, a line should call the second function.
# Demo:
# elixir hw3n.ex

defmodule Hw3n do

  # This module should hold two functions.
  
  def fn1 do
    # This function should have a receive-block.
    IO.puts "fn1 got called"
    receive do
      # This receive-block should match a tuple with a pid and some_string.
      {pid, some_string} ->
        # I should see if the message reaches first function:
        IO.puts some_string
    end
    
  end

  def fn2 do
    # I should call spawn/3 which spawns a call to the first function.
    fn1_pid = spawn Hw3n, :fn1, []
    # I should call send/2.
    # It should send message to first function process.
    send fn1_pid, {self(), "fn2 says hi to fn1."}
    IO.puts "I called fn2"
  end

end

# I should call the second function:
Hw3n.fn2
