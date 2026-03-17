local RexLib = dofile(os.getenv("HOME") .. "/.rexlib/rexlib.lua")
-- Test functions
print("Time:", RexLib.getTime())
print("Percent:", RexLib.inpercent(25, 100))

local t = {1,2,3}
local clone = RexLib.clonetable(t)
print("Cloned:", table.concat(clone, ", "))