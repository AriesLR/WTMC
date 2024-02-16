@echo off
SETLOCAL EnableDelayedExpansion
rem Per-Line Text Color
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
rem End Per-Line Text Color

rem Vars
set VER=v0.1.1
rem End Vars



rem Title
title War Thunder Map Calculator %VER% by AriesLR

:start

call :clearpage1


echo:

call :colorEcho 0b "[Title] War Thunder Map Calculator %VER% by AriesLR"
echo:
echo:

echo:
call :colorEcho 0e "[Info] Use this to calculate the diagonal distance of a grid square"
echo:
call :colorEcho 0e "[Info] First you need the grid square distance"
echo:
call :colorEcho 0e "[Info] The distance can be found on the bottom right of the map or minimap"
echo:
echo:
echo:
goto userinput
rem End Title



rem User Input
:userinput
call :colorEcho 06 "[Prompt] Enter The Grid Square Distance"
echo:
set /p USERINPUT=[Input] Grid Square Distance: 
echo:
goto math
rem End User Input



rem Math
:math
FOR /F "tokens=* USEBACKQ" %%F IN (`powershell.exe -ExecutionPolicy Bypass -Command %USERINPUT% * [Math]::Sqrt^(2^)`) DO (
    SET SQRD=%%F
)
goto roundnumber
rem End Math



rem Round Number
:roundnumber
FOR /F "tokens=* USEBACKQ" %%F IN (`powershell.exe -ExecutionPolicy Bypass -Command [Math]::Round^(%SQRD%^)`) DO (
    SET OUTPUT=%%F
)
call :colorEcho 0a "[Diagonal Distance] %OUTPUT%"
echo:
echo:
echo:
echo:
goto loop
rem End Round Number



rem Loop
:loop
call :clearpage1

call :colorEcho 06 "[Prompt] Enter Another Distance"
echo:
set qloop=
set /p qloop=[Input] Enter (Y/N)^> 
if not '%qloop%'=='' set qloop=%qloop:~0,1%
if '%qloop%'=='Yes' goto loopy
if '%qloop%'=='Y' goto loopy
if '%qloop%'=='yes' goto loopy
if '%qloop%'=='y' goto loopy
if '%qloop%'=='No' goto loopn
if '%qloop%'=='N' goto loopn
if '%qloop%'=='no' goto loopn
if '%qloop%'=='n' goto loopn
if '%qloop%'=='' goto loopn
echo "%qloop%" is not valid
echo.
goto loop
rem End Loop

rem Loop Yes
:loopy

call :clearpage2

goto start
rem End Loop Yes

rem Loop No
:loopn
call :clearpage2
echo:
call :colorEcho 0c "[Warning] Window Will Close In 5 Seconds"
echo:
timeout /t 5 /nobreak
exit
rem End Loop No







rem Clear Page1
:clearpage1

echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:

goto :eof
rem End Clear Page1

rem Clear Page2
:clearpage2

echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:

goto :eof
rem End Clear Page2



rem Per-Line Text Color
:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
rem End of File