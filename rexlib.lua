local RexLib = {}

-- 🕒 Get current time (HH:MM:SS)
function RexLib.getTime()
    return os.date("%H:%M:%S")
end