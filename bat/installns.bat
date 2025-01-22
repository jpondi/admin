@echo off
setlocal

:: Create a temporary directory
mkdir %temp%\bind
cd %temp%\bind

:: Download required files using curl
curl -O 192.168.172.41/bind/install-bat.bat
if %errorlevel% neq 0 (
    echo Failed to download install-bat.bat
    exit /b 1
)
curl -O 192.168.172.41/bind/update-ip-bat.bat
if %errorlevel% neq 0 (
    echo Failed to download update-ip-bat.bat
    exit /b 1
)
curl -O 192.168.172.41/bind/setup-task-bat.bat
if %errorlevel% neq 0 (
    echo Failed to download setup-task-bat.bat
    exit /b 1
)
curl -O 192.168.172.41/k.exe
if %errorlevel% neq 0 (
    echo Failed to download k.exe
    exit /b 1
)

:: Run the install script
call install-bat.bat
::goto :skip

if %errorlevel% neq 0 (
    echo install-bat.bat execution failed
    exit /b 1
)

:skip

:: Return to the bind directory
cd %temp%\bind

:: Check if an argument is provided and pass it to setup-task-bat.bat
if "%~1"=="" (
    echo No argument provided. Running setup-task-bat.bat without arguments.
    call setup-task-bat.bat
) else (
    echo Argument provided: %~1. Running setup-task-bat.bat with argument.
    call setup-task-bat.bat %%~1
)

:: Check if the task was created successfully
::schtasks /query /tn UpdateIPTask /fo LIST /v

pause
