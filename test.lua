local success, RexLib = pcall(dofile, "rexlib.lua")

if not success then
    return 
end

if type(RexLib) ~= "table" then
    return
end

print("Time:", RexLib.getTime())
print("Percent:", RexLib.inpercent(25, 100))

RexLib.wait(10)

local t = {1, 2, 3}
local clone = RexLib.clonetable(t)
print("Cloned:", table.concat(clone, ", "))