# d12.ex

# Demo:
# elixir d12.ex

# I should demo tail recursion

defmodule D12 do

  def fn1(0) do
    # I do know that factoral(0) is 1:
    1 
  end

  def fn1(n) do
    # I'm not sure what goes here yet
    # But I do know I need to call crutch_function/2:
    crutch_function(I dont know what should go here)
  end

  def crutch_function(n, cumulative_prod)
    # I'm not sure what goes here yet
    # I do know that tail recursion requires crutch_function/2 to be "alone":
    crutch_function(I dont know what should go here)
  end
end

