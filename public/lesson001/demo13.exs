# demo13.exs

# I use many parenthesis to help you see: "Arity"
# Arity is the integer in: Module.function/integer

defmodule Prt3 do

  def prt3() do
    IO.puts("Hello Idaho")
  end
    
  def prt3(input) do
    IO.puts(input)
  end
    
end

Prt3.prt3()
Prt3.prt3("Dan was here.")
