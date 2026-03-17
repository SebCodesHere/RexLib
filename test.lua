-- 1. Load the library from the SAME folder
local success, RexLib = pcall(dofile, "rexlib.lua")

if not success then
    print("\n--- ERROR IN REXLIB.LUA ---")
    print(RexLib) -- This prints the actual Lua error (like missing 'end')
    return 
end

-- 2. Check if RexLib actually returned the table
if type(RexLib) ~= "table" then
    print("ERROR: rexlib.lua did not 'return rexlib' at the end of the file!")
    return
end

-- 3. TEST FUNCTIONS
print("Time:", RexLib.getTime())
print("Percent (25 of 100):", RexLib.inpercent(25, 100))

print("Waiting 10 seconds...")
RexLib.wait(10)

local t = {1, 2, 3}
local clone = RexLib.clonetable(t)
print("Cloned:", table.concat(clone, ", "))