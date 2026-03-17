local RexLib = require("rexlib")

print("Current time:", RexLib.getTime())
print("Percent:", RexLib.inpercent(30,100))

local tbl = {1,2,3}
local cloned = RexLib.clonetable(tbl)
print(cloned)