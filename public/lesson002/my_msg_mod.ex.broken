# my_msg_mod.ex

# This script should create a Module I use to demonstrate how to
# receive and send messages.

# Demo:
# elixirc my_msg_mod.ex
# ls -l *.beam
# elixir -e "Elixir.MyMsgMod.rcv_snd1"

defmodule MyMsgMod do
  # This module should help me demonstrate how to receive and send messages.
  def rcv1 do
    # This function should help me demonstrate how to receive messages.
    receive do
      {sender, msg4me_s} ->
      IO.puts "sender: "
      IO.puts inspect(sender)
      IO.puts "I received this: "
      IO.puts inspect(msg4me_s)
    end
  end

  def snd_to(pid) do
    # This function should help me demonstrate how to send messages.
    msg_s = "Sell FB!, Sell AAPL!, Buy IBM(maybe)"
    IO.puts("I sent msg_s:")
    IO.puts  msg_s
    IO.puts "to pid: "
    IO.puts inspect(pid)
    send pid, {self(), msg_s}
  end

  def rcv_snd1 do
    # This function should help me demonstrate how to receive and send messages.
    my_pid = spawn(MyMsgMod, :rcv1, [])
    IO.puts "my_pid: "
    IO.puts inspect(my_pid)
    snd_to(my_pid)
  end
end
