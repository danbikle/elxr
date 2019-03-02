# d13.ex

# Demo:
# elixir d13.ex

# I should demo tail recursion

defmodule D13 do

  def fn1(0) do
    # I do know that factoral(0) is 1:
    1 
  end

  def fn1(n) do
    # I'm not sure what goes here yet
    # But I do know I need to call crutch_function/2:
    crutch_function(n, cp)
  end

  def crutch_function(n, cumulative_prod) do
  
    newcp = some-func(n, cumulative_prod) # I dont know yet
    
    # I do know that tail recursion requires crutch_function/2 to be "alone":
    crutch_function(n-1, newcp)
  end
end

