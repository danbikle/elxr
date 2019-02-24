# lesson002c.exs

# This script should call spawn() which should create a Process.
# A Process should have an identifier which we call a: "PID".

# The spawn/3 function wants these arguments:
# - Module name
# - Function name in that Module
# - List of arguments for the Function

# spawn/3 should return a PID after it spawns a Process
# from Elixir.SpawnMod.beam:

my_pid = spawn(SpawnMod, :hello2, [])

# I should see the PID.

# This fails:
# IO.puts my_pid

# This should show the PID:
IO.puts(inspect(my_pid))
