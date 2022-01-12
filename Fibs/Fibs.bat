@echo off
set /p n=""
set /a i=1
set /a a=1
set /a b=0
:l
set /a c=%a%+%b%
set /a r=%a%+%b%
set b=%a%
set a=%c%
set /a i=%i%+1
if %n% gtr %i% goto l
echo %r%
