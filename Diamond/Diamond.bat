@echo off
setlocal enabledelayedexpansion
set /p n=""
set /a o=2*n-1
for /l %%i in (1,1,%o%) do (
    set "s="
    if %%i gtr %n% (set /a l=2*%n%-%%i) else (set /a l=%%i)
    set /a p=%n%-!l!
    for /l %%i in (1,1,!p!) do set s=!s! 
    set /a p=2*!l!-1
    for /l %%i in (1,1,!p!) do set s=!s!*
    echo !s!
)
pause