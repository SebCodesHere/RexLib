@echo off
if not exist "%USERPROFILE%\.rexlib" mkdir "%USERPROFILE%\.rexlib"
powershell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/SebCodesHere/RexLib/1.0.0/rexlib.lua' -OutFile $env:USERPROFILE\.rexlib\rexlib.lua"
echo RexLib v1.0.0 installed to %USERPROFILE%\.rexlib
pause