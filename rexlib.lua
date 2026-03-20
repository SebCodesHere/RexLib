-- rexlib.lua
local rexlib = {}

function rexlib.inPercent(value,maxvalue)
    local percentage = (value/maxvalue)*100
    return percentage
end

function rexlib.cloneTable(TableName)
    if type(TableName) == "table" then
        local clonetable = {}
        for i, v in pairs(TableName) do
            if v then
                clonetable[i] = v
            end
        end
        return clonetable
    else
        return print("NOT A TABLE!")
    end
end

function rexlib.wait(time)
    if type(time) == "number"   then
       local start = os.clock()
       repeat
        
       until os.clock() -start > time
    end
end

function rexlib.filter(t,condition)
    if type(t) ~= "table" then end
    local metcondition = {}
    for i,v in pairs(t) do
        if condition(v) then
            table.insert(metcondition,v)
        end
    end
    return metcondition
end

function rexlib.repeatFunction(fun,ammount)
    if type(fun) ~= "function" then return print("Not A Function") end
    if type(ammount) ~= "number" then print("Not A Number") end
    if ammount ~= -1 then
        for i = 1,ammount do
            fun()
            print("functioning")
        end
    elseif ammount == -1 then
        while  true do
            rexlib.wait(0.2)
            fun()
        end
    end
end

function rexlib.removeFromTable(t,remove)
if type(t) == "table" and type(remove) == "table" then
  local toRemove = {}
    for _, v in pairs(remove) do toRemove[v] = true end

    for i = #t, 1, -1 do
        if toRemove[t[i]] then
            table.remove(t, i)
            end
        end
    end
end
return rexlib