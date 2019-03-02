# hw3h.ex

# This script should:
# have a module that holds two functions.
# Demo:
# elixir hw3h.ex

defmodule Hw3h do

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
    # This function should call spawn/3
    spawn 1,2,3
  end

end

# I should call the first function:
# Hw3h.fn1
