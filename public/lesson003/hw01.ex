# hw01.ex

# This script should help me do hw in lesson003.

# Demo:
# elixir hw01.ex

defmodule Hw01 do
  # This module should hold two functions
  
  def fn01 do
    receive do
      {pid, "I ama string"} -> "hello"
    end
    "I am fn01"
  end
  
  def fn02 do
    "I am fn02"
  end
    
end

# I should call the first function:
Hw01.fn01
