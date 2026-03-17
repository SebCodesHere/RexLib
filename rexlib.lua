local RexLib = {}

function RexLib.getTime()
    return os.date("%H:%M:%S")
end

function RexLib.inpercent(value,maxvalue)
local percentage = maxvalue/value*100
return percentage
end