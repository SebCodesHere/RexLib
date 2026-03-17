-- rexlib.lua
local RexLib = {}

function RexLib.getTime()
    return os.date("%H:%M:%S")
end

function RexLib.inpercent(value,maxvalue)
    local percentage = maxvalue/value*100
    return percentage
end

function RexLib.clonetable(TableName)
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

return RexLib