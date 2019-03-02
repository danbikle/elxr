# d11.ex

# Demo:
# elixir d11.ex

# I should demo tail recursion

defmodule D11 do

  def fn1(0) do
    1
  end

  # fn1/1 is tail recursive but it does not do what I want:
  def fn1(n) do
    # The recusive call should be: "alone".
    # n * fn1(n-1) # is not tail recursive
    fn1(n-1) # is "alone", it is tail recursive.
  end

end

