# hw3e.ex

# This script should:
# have a module that holds two functions.
# Demo:
# elixir hw3e.ex

defmodule Hw3e do

  # This module should hold two functions.
  
  def fn1 do
    # This function should have a receive-block.
    receive do
      # This receive-block should match a tuple
      {} -> "hello"
    end
    
  end

  def fn2 do
    # This function should do nothing.  
  end

end
