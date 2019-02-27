# ur_msg_mod3.ex

# This script should create a Module I use to demonstrate how to
# send messages and use the after clause inside a receive block.
# Also, it should demo recursion inside the receive-block.

# Demo:
# elixirc ur_msg_mod3.ex
# ls -l *.beam
# elixir -e "Elixir.UrMsgMod3.ur_sndr"

# ASCII art and English description of the demo:
# Wakeup UrMsgMod3.ur_rcv and get its pid
# sender -- "Sell IBM!!" -- > pid
# receiver sees: {sender_pid, msg}
# receiver -- "I got your msg." -- > acksender_pid
# re-call: UrMsgMod3.ur_rcv()
# receiver, with same pid as before, ready for more messages
# sender sees: {acksender_pid, msg}
# sender -- "Sell more IBM!!" -- > pid
# receiver sees: {sender_pid, msg}
# receiver -- "I got your msg." -- > acksender_pid
# sender sees: {acksender_pid, msg}

defmodule UrMsgMod3 do
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
	msg2_s = "I got your msg."
        send sender_pid, {self(), msg2_s}
	# I should use recursion to wait for more messages:
	ur_rcv()
    end
  end

  def ur_sndr do
    pid = spawn(UrMsgMod3, :ur_rcv, [])
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
