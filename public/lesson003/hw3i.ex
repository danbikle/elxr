# hw3i.ex

# hw: Enhance the call to spawn/3 so it spawns a call to the first function.

# This script should:
# have a module that holds two functions.
# Demo:
# elixir hw3i.ex

defmodule Hw3i do

  # This module should hold two functions.
  
  def fn1 do
    # This function should have a receive-block.
    receive do
      # This receive-block should match a tuple with a pid and some_string.
      # The function-body should be: "hello"
      {pid, some_string} -> "hello" 
    end
    
  end

  def fn2 do
    # I should call spawn/3 which spawns a call to the first function.
    fn1_pid = spawn Hw3i, :fn1, []
  end

end

# I should call the first function:
# Hw3i.fn1
