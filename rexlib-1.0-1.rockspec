package = "rexlib"
version = "1.0-1"
ssource = {
    url = "https://raw.githubusercontent.com/SebCodesHere/RexLib/v1.0.0/rexlib.lua"
}
}
description = {
    summary = "RexLib Lua utility functions",
    detailed = [[
        RexLib provides utility functions:
        - getTime()
        - inpercent(value,maxvalue)
        - clonetable(TableName)
    ]],
    license = "Apache License 2.0"
}
dependencies = {}  -- no external dependencies
build = {
    type = "builtin",
    modules = {
        rexlib = "rexlib.lua"
    }
}