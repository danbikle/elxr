# d10.ex

# Demo:
# elixir d10.ex

# I should demo plain recursion

defmodule D10 do

  def fn1(0) do
    1
  end

  def fn1(n) do
    n * fn1(n-1)
  end

end

IO.puts D10.fn1(0)
IO.puts D10.fn1(1)
IO.puts D10.fn1(2)
IO.puts D10.fn1(3)
IO.puts D10.fn1(4)
IO.puts D10.fn1(5)
