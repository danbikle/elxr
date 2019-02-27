# ur_msg_mod2.ex

# This script should create a Module I use to demonstrate how to
# send messages and use the after clause inside a receive block.

# Demo:
# elixirc ur_msg_mod2.ex
# ls -l *.beam
# elixir -e "Elixir.UrMsgMod2.ur_sndr"

# ASCII art and English description of the demo:
# Wakeup UrMsgMod2.ur_rcv and get its pid
# sender -- "Sell IBM!!" -- > pid
# receiver sees: {sender_pid, msg}
# receiver -- "I got your first msg." -- > acksender_pid
# sender sees: {acksender_pid, msg}
# sender -- "Sell more IBM!!" -- > pid


defmodule UrMsgMod2 do
  def ur_rcv do
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
    # I should NOT wait for second msg.
  end

  def ur_sndr do
    pid = spawn(UrMsgMod2, :ur_rcv, [])
    # I should send first message:
    msg1_s = "Sell IBM!!"
    send pid, {self(), msg1_s}
    # I should receive acknowledgment:
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
    # I should receive second acknowledgment:
    receive do
      {acksender_pid, message} ->
      IO.puts "Then, "
      IO.puts inspect(acksender_pid)
      IO.puts "Says again: "
      IO.puts message
      # I should time-out after 500 milliseconds:
      after 500 ->
        IO.puts "I sent a msg to:"
        IO.puts inspect(pid)
	IO.puts "I did not receive a response for some reason."
    end
  end
end
