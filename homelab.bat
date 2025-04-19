@echo off
setlocal enabledelayedexpansion
pushd "D:\Randoms\homelab"
set COMMAND=%1
if "%COMMAND%" == "--help" (
    echo "Current working directory: %CD%"
    echo "Usage: homelab.bat [all|up|down]"
    echo "all: Start all services"
    echo "up: Start services one by one based on user input (Y/n)"
    echo "down: Stop all services"
) else if "%COMMAND%" == "all" (
    set COMMAND=up
    for /d %%i in (*) do (
        cd %%i
        docker compose up -d
        cd ..
    )
) else if "%COMMAND%" == "up" (
    for /d %%i in (*) do (
        @REM echo Starting %%i
        set /p "choice=Do you want to start %%i? [Y/n]: "
        if /i "!choice!" == "n" (
            @REM echo Skipping %%i
            set "choice=Y"
        ) else (
            cd %%i
            docker compose up -d
            cd ..
        )
    )
) else if "%COMMAND%" == "down" (
    for /d %%i in (*) do (
        cd %%i
        docker compose down
        cd ..
    )
) else (
    echo "Usage: homelab.bat [all|up|down]"
)
endlocal