# hw3g.ex

# hw:  Below the module, write a line which calls the first function.

# This script should:
# have a module that holds two functions.
# Below the module, a line should call the first function.
# Demo:
# elixir hw3g.ex

defmodule Hw3g do

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
    # This function should do nothing.  
  end

end

# I should call the first function:
Hw3g.fn1
