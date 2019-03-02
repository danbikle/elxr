# hw3f.ex

# hw: Enhance the tuple so it matches: {PID, some_string}

# This script should:
# have a module that holds two functions.
# Demo:
# elixir hw3f.ex

defmodule Hw3f do

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
