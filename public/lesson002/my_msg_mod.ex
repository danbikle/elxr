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
  end

  def snd1 do
    # This function should help me demonstrate how to send messages.
  end

  def rcv_snd1 do
    # This function should help me demonstrate how to receive and send messages.
  end
end
