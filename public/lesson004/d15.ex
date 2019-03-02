# d15.ex

# Demo:
# elixir d15.ex

# I should use tail recursion to implement factoral(n)

defmodule D15 do

  def fctrl(0) do
    # I do know that factoral(0) is 1:
    1 
  end

  def fctrl(n) do
    cp = 1 # cumulative_product inital value
    crutch_function(n, cp)
  end

  # I should watch for n = 0:
  def crutch_function(0, cumulative_prod) do
    cumulative_prod
  end
  
  def crutch_function(n, cumulative_prod) do
    newcp = n * cumulative_prod # I remember and accumulate the product.
    # Tail recursion requires crutch_function/2 to be "alone":
    crutch_function(n-1, newcp)#s.b. 1 if n is 1
  end
  
end

IO.puts D15.fctrl(0)
IO.puts D15.fctrl(1)
IO.puts D15.fctrl(2)
IO.puts D15.fctrl(3)
IO.puts D15.fctrl(4)
IO.puts D15.fctrl(5)
