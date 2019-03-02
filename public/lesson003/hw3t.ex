# hw3t.ex

# hw: In the module write a fourth function which only sends a message and receives an acknowldgment.

# This script should:
# have a module that holds two functions.
# Below the module, a line should call the second function.
# Demo:
# elixir hw3t.ex

defmodule Hw3t do

  # This module should hold two functions.
  
  def fn1 do
    # This function should have a receive-block.
    IO.puts "fn1 got called"
    receive do
      # This receive-block should match a tuple with a pid and some_string.
      {pid, some_string} ->
        # I should see if the message reaches first function:
        IO.puts some_string
	send pid, {"fn1 acknowledges message"}
    end
    fn1()
  end

  def fn2 do
    IO.puts "I called fn2"
    # I should call spawn/3 which spawns a call to the first function.
    fn1_pid = spawn Hw3t, :fn1, []
    # I should call send/2.
    # It should send message to first function process.
    send fn1_pid, {self(), "fn2 says 1 hi to fn1."}
    send fn1_pid, {self(), "fn2 says 2 hi to fn1."}
    send fn1_pid, {self(), "fn2 says 3 hi to fn1."}
    send fn1_pid, {self(), "fn2 says 4 hi to fn1."}
    send fn1_pid, {self(), "fn2 says 5 hi to fn1."}
    receive do {ack} -> IO.puts inspect({ack, 1}) end
    receive do {ack} -> IO.puts inspect({ack, 2}) end
    receive do {ack} -> IO.puts inspect({ack, 3}) end
    receive do {ack} -> IO.puts inspect({ack, 4}) end
    receive do {ack} -> IO.puts inspect({ack, 5}) end
  end
  
  def rcvm_sndack({pid, msg_s}) do
    # This function should
    # only receive a message and send an acknowldgment.
    receive do
      {pid, msg_s} -> send pid, {"ack"}
    end
  end

  def sndm_rcvack({pid, msg_s}) do
    # This function should
    # only send a message and receive an acknowldgment.
    send pid, msg_s
    receive do
      {ack_s} ->  IO.puts ack_s
    end
  end

end
# I should call the second function:
Hw3t.fn2
