# hw3k.ex

# hw: Enhance the send/2 call so it sends a message to first function process.

# This script should:
# have a module that holds two functions.
# Demo:
# elixir hw3k.ex

defmodule Hw3k do

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
    fn1_pid = spawn Hw3k, :fn1, []
    # I should call send/2.
    # It should send message to first function process.
    send fn1_pid, {self, "fn2 says hi to fn1."}
  end

end

# I should call the first function:
# Hw3k.fn1
