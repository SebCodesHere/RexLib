RexLib = require("rexlib.lua")
table1 = {"apple","monkey","car"}
tableremove = {"car","monkey"}

RexLib.removeFromTable(table1,tableremove)
for i,v in pairs(table1) do
    print(v)
end
--RexLib.repeatFunction(RexLib.getTime,5)

--print("Current time:", RexLib.getTime())
--print("Percent:", RexLib.inpercent(25,100))

--RexLib.wait(5)
--local tbl = {1,2,3}
--local cloned = RexLib.clonetable(tbl)
--print(cloned)