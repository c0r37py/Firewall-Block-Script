@echo off
setlocal enableextensions
cd /d "%~dp0"

set extensions=.exe .dll .com .bat .cmd .ps1 .vbs .js .py

for %%e in (%extensions%) do (
    for /R %%a in (*%%e) do (
        echo Found: %%a
        call netsh advfirewall firewall add rule name="Blocked %%~nxa (Incoming)" dir=in program="%%a" action=block
        call netsh advfirewall firewall add rule name="Blocked %%~nxa (Outgoing)" dir=out program="%%a" action=block
        echo Blocked: %%a
    )
)

echo Done!
endlocal
pause
