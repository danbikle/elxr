# hw3j.ex

# hw: Enhance the second function so it calls send/2.

# This script should:
# have a module that holds two functions.
# Demo:
# elixir hw3j.ex

defmodule Hw3j do

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
    fn1_pid = spawn Hw3j, :fn1, []
    # I should call send/2.
    send 1,2
  end

end

# I should call the first function:
# Hw3j.fn1
