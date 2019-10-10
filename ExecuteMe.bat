@echo off

set _path="dir /s /b "*.ps1""

for /F "tokens=*" %%i in ('%_path%') do (set _path=%%i)

powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -NoExit -Command `\"%_path%"\" -Verb RunAs"