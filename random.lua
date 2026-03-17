-- random.lua
local home = os.getenv("HOME")
package.path = package.path .. ";" .. home .. "/.luarocks/share/lua/5.4/?.lua;" .. home .. "/.luarocks/share/lua/5.4/?/init.lua"
package.cpath = package.cpath .. ";" .. home .. "/.luarocks/lib/lua/5.4/?.so"

local RexLib = require("rexlib")

print("Current time:", RexLib.getTime())
print("Percent example:", RexLib.inpercent(25, 100))

local tbl = {1, 2, 3}
local clone = RexLib.clonetable(tbl)
print("Cloned table:", table.concat(clone, ", "))