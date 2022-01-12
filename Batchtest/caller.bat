@echo off
set _Local_Path=%~dp0
set vara="Hello There"
set varb=67890

echo Variables set in caller.bat:
echo %vara%
echo %varb%

echo Calling passTo.bat
call passTo.bat %vara% %varb% %_Local_Path%