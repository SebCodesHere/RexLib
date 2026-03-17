-- rexlib.lua
local rexlib = {}

function rexlib.getTime()
    return os.date("%H:%M:%S")
end

function rexlib.inpercent(value,maxvalue)
    local percentage = maxvalue/value*100
    return percentage
end

function rexlib.clonetable(TableName)
    if type(TableName) == "table" then
        local clonetable = {}
        for i, v in pairs(TableName) do
            if v then
                table.insert(clonetable,v)
            end
        end
        return clonetable
    else
        print("NOT A TABLE!")
        return {}
    end
end

return rexlib