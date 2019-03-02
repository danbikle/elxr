# hw3u.ex

# hw: Enhance the module so the third and fourth functions are used in the first and second.

# This script should:
# have a module that holds two functions.
# Below the module, a line should call the second function.
# Demo:
# elixir hw3u.ex

defmodule Hw3u do

  # This module should wrap send/2 and receive with functions.
  
  def fn1 do
    rcvm_sndack()
    fn1() # should receive more
  end

  def fn2 do
    # I should call spawn/3 which spawns a call to the first function.
    fn1_pid = spawn Hw3u, :fn1, []
    sndm_rcvack(fn1_pid, "fn2 says 1 hi to fn1.")
    sndm_rcvack(fn1_pid, "fn2 says 2 hi to fn1.")
    sndm_rcvack(fn1_pid, "fn2 says 3 hi to fn1.")
    sndm_rcvack(fn1_pid, "fn2 says 4 hi to fn1.")
    sndm_rcvack(fn1_pid, "fn2 says 5 hi to fn1.")
  end
  
  def rcvm_sndack() do
    # This function should
    # only receive a message and send an acknowldgment.
    receive do
      {pid, msg_s} ->
        send pid, {"ack"}
	IO.puts msg_s
    end
  end

  def sndm_rcvack(pid, msg_s) do
    # This function should
    # only send a message and receive an acknowldgment.
    send pid, {self(), msg_s}
    receive do
      {ack_s} ->  IO.puts ack_s
    end
  end

end
# I should call the second function:
Hw3u.fn2
