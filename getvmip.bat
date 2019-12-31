:: Get VirtualBox VM IP using guestcontrol command execution
::
:: Args:
::  1: VM name
::  2: User name
::  3: Password
::
:: Example output:
::  Guest OS:                    Ubuntu (64-bit)
::  
::  IPAddress
::  ---------
::  10.0.0.1

@echo off

:: blank line 
echo.

:: get guest OS and print to terminal
for /F "tokens=*" %%g in ('vboxmanage showvminfo %1 ^| findstr /C:"Guest OS"') do (set GUESTOS=%%g)
echo %GUESTOS%

:: check if VM is Windows
echo %GUESTOS% | findstr /C:"Windows" 1>nul

:: if not Windows, use bash + ifconfig
:: if Windows, use Get-NetIPAddress PowerShell cmdlet
if errorlevel 1 (
    echo.
    vboxmanage guestcontrol %1 --username %2 --password %3 run --exe "/bin/bash" -- "bash" "-c" "echo -e 'IPAddress\n---------' && /sbin/ifconfig | grep 'inet\s' | grep -v 127.0.0.1| awk '{print $2}'"
) else (
    vboxmanage guestcontrol %1 --username %2 --password %3 run --exe "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -- "powershell" "-c" "Get-NetIPAddress | Where-Object {($_.AddressFamily -eq 'IPv4') -and ($_.IPAddress -ne '127.0.0.1') -and ($_.IPAddress -ne $null)} | Select IPAddress"
)
