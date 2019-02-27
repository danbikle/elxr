# uh1_msg_mod1.ex

# This script should create a Module I use to demonstrate
# an Unhappy-Path of receive and send messages.

# Demo:
# elixirc uh1_msg_mod1.ex
# ls -l *.beam
# elixir -e "Elixir.Uh1MsgMod1.ur_sndr"

defmodule Uh1MsgMod1 do
  def uh_rcv do
    # I should wait for first msg:
    receive do
      {sender_pid, msg} ->
        IO.puts inspect(self())
        IO.puts "received: "
	IO.puts inspect(msg)
	IO.puts "From sender_pid:"
	IO.puts inspect(sender_pid)
	# I should acknowledge the msg:
	msg2_s = "I got your first msg."
        send sender_pid, {self(), msg2_s}
    end
    # I should NOT wait for second msg,
    # which should cause a problem if a second msg comes.
  end

  def uh_sndr do
    pid = spawn(Uh1MsgMod1, :uh_rcv, [])
    # I should send first message:
    msg1_s = "Sell IBM!!"
    send pid, {self(), msg1_s}
    # I should receive acknowledgement:
    receive do
      {acksender_pid, message} ->
      IO.puts "Then, "
      IO.puts inspect(acksender_pid)
      IO.puts "Says: "
      IO.puts message
    end
    # I should send second message:
    msg2_s = "Sell more IBM!!"
    send pid, {self(), msg2_s}
    # I should receive second acknowledgement:
    receive do
      {acksender_pid, message} ->
      IO.puts "Then, "
      IO.puts inspect(acksender_pid)
      IO.puts "Says again: "
      IO.puts message
    end
  end
end

