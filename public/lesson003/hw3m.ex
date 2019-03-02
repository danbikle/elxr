# hw3m.ex

# hw: Run the script and see if the second function gets called.

# This script should:
# have a module that holds two functions.
# Below the module, a line should call the second function.
# Demo:
# elixir hw3m.ex

defmodule Hw3m do

  # This module should hold two functions.
  
  def fn1 do
    # This function should have a receive-block.
    receive do
      # This receive-block should match a tuple with a pid and some_string.
      # The function-body should be: "hello"
      {pid, some_string} -> "hello" 
      IO.puts "fn1 got called"
    end
    
  end

  def fn2 do
    # I should call spawn/3 which spawns a call to the first function.
    fn1_pid = spawn Hw3m, :fn1, []
    # I should call send/2.
    # It should send message to first function process.
    send fn1_pid, {self(), "fn2 says hi to fn1."}
    IO.puts "I called fn2"
  end

end

# I should call the second function:
Hw3m.fn2
