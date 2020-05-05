@echo off

:: arg 1 = source file on linux vm

:: copy file from linux to host
vboxmanage guestcontrol vm1 --username ubuntu --password pass copyfrom %1 .

:: get local file name from arg 
for %%a in (%1) do set "filename=%%~nxa"

:: copy file on host to vm
vboxmanage guestcontrol vm2 --username administrator --password pass copyto %filename% C:\users\administrator\desktop

:: delete file on host
del %filename%
