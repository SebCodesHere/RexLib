@echo off
REM Create folder if it doesn't exist
if not exist "%USERPROFILE%\.rexlib" mkdir "%USERPROFILE%\.rexlib"

REM Download the tagged version
powershell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/SebCodesHere/RexLib/1.0-1/rexlib.lua' -OutFile $env:USERPROFILE\.rexlib\rexlib.lua"

echo RexLib 1.0-1 installed to %USERPROFILE%\.rexlib
pause