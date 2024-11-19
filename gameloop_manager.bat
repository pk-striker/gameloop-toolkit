@echo off
title GameLoop Management Script
:menu
cls
echo =========================================
echo GameLoop Management Script
echo =========================================
echo 1. Start GameLoop
echo 2. Kill GameLoop
echo 3. Uninstall GameLoop
echo 4. Install GameLoop
echo =========================================
set /p choice=Enter your choice (1-4): 

if %choice%==1 goto start_gameloop
if %choice%==2 goto kill_gameloop
if %choice%==3 goto uninstall_gameloop
if %choice%==4 goto install_gameloop
goto menu

:start_gameloop
echo Starting GameLoop...
start "" "D:\gameloop\TxGameAssistant\ui\AndroidEmulatorEx.exe"
goto menu

:kill_gameloop
echo Killing GameLoop...
taskkill /F /IM "GameLoop.exe" 2>nul
taskkill /F /IM "AndroidEmulator.exe" 2>nul
taskkill /F /IM "QMEmulatorService.exe" 2>nul
taskkill /F /IM "adb.exe" 2>nul
goto menu

:uninstall_gameloop
echo Uninstalling GameLoop...
taskkill /F /IM "GameLoop.exe" 2>nul
taskkill /F /IM "AndroidEmulator.exe" 2>nul
taskkill /F /IM "QMEmulatorService.exe" 2>nul
taskkill /F /IM "adb.exe" 2>nul
for %%d in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\ (
        for /d %%p in (%%d:\*Tencent* %%d:\*TxGameAssistant*) do (
            echo Deleting %%p
            rd /s /q "%%p" 2>nul
        )
    )
)
goto menu

:install_gameloop
echo Downloading and Installing GameLoop...
start "" "https://down.gameloop.com/channel/3/26460/GLP_installer_900223150_market.exe"
goto menu
