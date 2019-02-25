
defmodule MyMsgMod do
  def my_rcv do
    # I should wait for a msg:
    receive do
      {sender, msg} ->
        IO.puts inspect(self())
        IO.puts "received: "
	IO.puts inspect(msg)
	IO.puts "From sender:"
	IO.puts inspect(sender)
	# I should acknowledge the msg:
	msg2_s = "I got your msg."
        send sender, {self(), msg2_s}
    end
  end

  def my_sndr do
    pid = spawn(MyMsgMod, :my_rcv, [])
    # I should send a message:
    msg1_s = "Sell FB!, Sell AAPL!"
    send pid, {self(), msg1_s}
    # I should receive acknowledgement:
    receive do
      {acksender, message} ->
      IO.puts "Then, "
      IO.puts inspect(acksender)
      IO.puts "Says: "
      IO.puts message
    end
  end
end

# drum roll:
MyMsgMod.my_sndr


