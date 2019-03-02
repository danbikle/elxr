# d14.ex

# Demo:
# elixir d14.ex

# I should demo tail recursion

defmodule D14 do

  def fn1(0) do
    # I do know that factoral(0) is 1:
    1 
  end

  def fn1(n) do
    # I'm not sure what goes here yet
    # But I do know I need to call crutch_function/2:
    cp = 1 # If n is 1 cp s.b. 1
    # Maybe cp = 1 works all the time?
    crutch_function(n, cp)
  end

  # I should watch for n = 0,1:
  def crutch_function(0, cumulative_prod) do
    cumulative_prod
  end
  
  def crutch_function(n, cumulative_prod) do
  
    newcp = n * cumulative_prod # I should try this.
    
    # I do know that tail recursion requires crutch_function/2 to be "alone":
    crutch_function(n-1, newcp)#s.b. 1 if n is 1
  end
  
end

IO.puts D14.fn1(0)
IO.puts D14.fn1(1)
IO.puts D14.fn1(2)

