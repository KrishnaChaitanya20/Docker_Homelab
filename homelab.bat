@echo off
setlocal enabledelayedexpansion
pushd "D:\Randoms\homelab"
set COMMAND=%1
set SERVICE=%2
if "%COMMAND%" == "--help" (
    echo "Current working directory: %CD%"
    echo "Usage: homelab.bat [all|up|down|start <service-name>|stop <service-name>]"
    echo "all: Start all services"
    echo "up: Start services one by one based on user input (Y/n)"
    echo "down: Stop all services"
    echo "start <service-name>: Start a specific service by name"
    echo "stop <service-name>: Stop a specific service by name"
) else if "%COMMAND%" == "all" (
    set COMMAND=up
    for /d %%i in (*) do (
        cd %%i
        docker-compose up -d
        cd ..
    )
) else if "%COMMAND%" == "up" (
    for /d %%i in (*) do (
        set /p "choice=Do you want to start %%i? [Y/n]: "
        if /i "!choice!" == "n" (
            set "choice=Y"
        ) else (
            cd %%i
            docker-compose up -d
            cd ..
        )
    )
) else if "%COMMAND%" == "down" (
    for /d %%i in (*) do (
        cd %%i
        docker-compose down
        cd ..
    )
) else if "%COMMAND%" == "start" (
    if not defined SERVICE (
        echo "Error: Service name is required for start-service."
    ) else (
        if exist "%SERVICE%" (
            cd "%SERVICE%"
            docker-compose up -d
            cd ..
        ) else (
            echo "Error: Service '%SERVICE%' does not exist."
        )
    )
) else if "%COMMAND%" == "stop" (
    if not defined SERVICE (
        echo "Error: Service name is required for stop-service."
    ) else (
        if exist "%SERVICE%" (
            cd "%SERVICE%"
            docker-compose down
            cd ..
        ) else (
            echo "Error: Service '%SERVICE%' does not exist."
        )
    )
) else (
    echo "Usage: homelab.bat [all|up|down|start <service-name>|stop <service-name>]"
)
endlocal