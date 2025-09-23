#!/bin/bash

# Homelab Docker Services Management Script
# Usage: ./homelab.sh [all|up|down|start <service-name>|stop <service-name>]

# Change to the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"
source  ~/.bashrc
COMMAND=$1
SERVICE=$2

case "$COMMAND" in
    "--help"|"-h"|"help")
        echo "Current working directory: $(pwd)"
        echo "Usage: ./homelab.sh [all|up|down|start <service-name>|stop <service-name>]"
        echo "all: Start all services"
        echo "up: Start services one by one based on user input (Y/n)"
        echo "down: Stop all services"
        echo "start <service-name>: Start a specific service by name"
        echo "stop <service-name>: Stop a specific service by name"
        ;;
    "all")
        echo "Starting all services..."
        for dir in */; do
            if [ -d "$dir" ] && [ -f "$dir/compose.yaml" -o -f "$dir/docker-compose.yml" -o -f "$dir/docker-compose.yaml" ]; then
                echo "Starting service in $dir"
                cd "$dir"
                docker compose up -d
                cd ..
            fi
        done
        ;;
    "up")
        echo "Starting services interactively..."
        for dir in */; do
            if [ -d "$dir" ] && [ -f "$dir/compose.yaml" -o -f "$dir/docker-compose.yml" -o -f "$dir/docker-compose.yaml" ]; then
                service_name=${dir%/}
                read -p "Do you want to start $service_name? [Y/n]: " choice
                case "$choice" in
                    [nN]|[nN][oO])
                        echo "Skipping $service_name"
                        ;;
                    *)
                        echo "Starting $service_name"
                        cd "$dir"
                        docker compose up -d
                        cd ..
                        ;;
                esac
            fi
        done
        ;;
    "down")
        echo "Stopping all services..."
        for dir in */; do
            if [ -d "$dir" ] && [ -f "$dir/compose.yaml" -o -f "$dir/docker-compose.yml" -o -f "$dir/docker-compose.yaml" ]; then
                echo "Stopping service in $dir"
                cd "$dir"
                docker compose down
                cd ..
            fi
        done
        ;;
    "start")
        if [ -z "$SERVICE" ]; then
            echo "Error: Service name is required for start command."
            echo "Usage: ./homelab.sh start <service-name>"
        else
            if [ -d "$SERVICE" ]; then
                echo "Starting service: $SERVICE"
                cd "$SERVICE"
                docker compose up -d
                cd ..
            else
                echo "Error: Service '$SERVICE' does not exist."
            fi
        fi
        ;;
    "stop")
        if [ -z "$SERVICE" ]; then
            echo "Error: Service name is required for stop command."
            echo "Usage: ./homelab.sh stop <service-name>"
        else
            if [ -d "$SERVICE" ]; then
                echo "Stopping service: $SERVICE"
                cd "$SERVICE"
                docker compose down
                cd ..
            else
                echo "Error: Service '$SERVICE' does not exist."
            fi
        fi
        ;;
    *)
        echo "Usage: ./homelab.sh [all|up|down|start <service-name>|stop <service-name>]"
        echo "Use './homelab.sh --help' for more information."
        ;;
esac