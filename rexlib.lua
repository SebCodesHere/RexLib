-- rexlib.lua
local rexlib = {}

function rexlib.getTime()
    return os.date("%H:%M:%S")
end

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

return rexlib