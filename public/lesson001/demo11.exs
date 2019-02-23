# demo11.exs

defmodule Mymod1 do
  # This module should have two functions.
  
  def prt_hello do
    IO.puts "Hello California"
  end
  
  # Parenthesis optional here:
  def prt(input) do
    IO.puts(input) # Parenthesis optional here.
  end

end

Mymod1.prt_hello()

Mymod1.prt("Hello Colo.") # Parenthesis optional here.
Mymod1.prt 123.6


