# d20.ex

# Demo:
# elixir d20.ex

# I should demo tail recursion

defmodule D20 do

  def fn1(0,cp) do
    cp
  end

  def fn1(n,cp) do
    arg2 = n * cp
    arg1 = n-1
    fn1(arg1, arg2)
  end
  
  def fn2(n) do
    fn1(n,1)
  end

end

IO.puts D20.fn1(0,1)
IO.puts D20.fn1(1,1)
IO.puts D20.fn1(2,1)
IO.puts D20.fn1(3,2)
IO.puts D20.fn2(0)
IO.puts D20.fn2(1)
IO.puts D20.fn2(2)
IO.puts D20.fn2(3)
IO.puts D20.fn2(4)
IO.puts D20.fn2(5)
