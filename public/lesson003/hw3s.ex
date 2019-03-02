# hw3s.ex

# hw: In the module write a third function which only receives a message and sends an acknowldgment.

# This script should:
# have a module that holds two functions.
# Below the module, a line should call the second function.
# Demo:
# elixir hw3s.ex

defmodule Hw3s do

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
    fn1_pid = spawn Hw3s, :fn1, []
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
end

# I should call the second function:
Hw3s.fn2
