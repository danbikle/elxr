# my_msg_mod.ex

# This script should create a Module I use to demonstrate how to
# receive and send messages.

# Demo:
# elixirc my_msg_mod.ex
# ls -l *.beam
# elixir -e "Elixir.MyMsgMod.my_sndr"

# Wakeup MyMsgMod.my_rcv and get its pid
# sender -- "Sell FB!, Sell AAPL!" -- > pid
# receiver sees: {sender_pid, msg}
# receiver -- "I got your msg."    -- > acksender_pid
# sender sees: {acksender_pid, msg}

defmodule MyMsgMod do
  def my_rcv do
    # I should wait for a msg:
    receive do
      {sender_pid, msg} ->
        IO.puts inspect(self())
        IO.puts "received: "
	IO.puts inspect(msg)
	IO.puts "From sender_pid:"
	IO.puts inspect(sender_pid)
	# I should acknowledge the msg:
	msg2_s = "I got your msg."
        send sender_pid, {self(), msg2_s}
    end
  end

  def my_sndr do
    pid = spawn(MyMsgMod, :my_rcv, [])
    # I should send a message:
    msg1_s = "Sell FB!, Sell AAPL!"
    send pid, {self(), msg1_s}
    # I should receive acknowledgement:
    receive do
      {acksender_pid, message} ->
      IO.puts "Then, "
      IO.puts inspect(acksender_pid)
      IO.puts "Says: "
      IO.puts message
    end
  end
end


