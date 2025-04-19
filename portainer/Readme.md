# Portainer Configuration

This folder contains the compose files and configuration for setting up Portainer, a lightweight management UI for Docker environments.

## Purpose

The purpose of this folder is to provide a self-hosted solution for managing Docker containers, images, networks, and volumes using a web-based interface.

## Usage

### Prerequisites
- A Docker network named `homelab` must exist.
- Set up `LOCAL_DOMAIN` and `PUBLIC_DOMAIN` domain variables either as system variables or in a `.env` file. The `.env` file should be in the same directory as the compose file and should be included in the compose file. The variables are used to route traffic from the Traefik service to the Portainer service. The `.env` file should look like this:
    ```bash
    LOCAL_DOMAIN=localdomain.com
    PUBLIC_DOMAIN=publicdomain.com
    ```

### Steps
1. Navigate to the `portainer` folder:
    ```bash
    cd portainer
    ```

2. Deploy the Portainer service using Docker Compose:
    ```bash
    docker compose up -d
    ```

3. Access the Portainer UI at:
    - `http://portainer.${LOCAL_DOMAIN}`
    - `http://portainer.${PUBLIC_DOMAIN}`

### Notes
- The `portainer_data` volume is used to store Portainer's persistent data.
- Ensure that the Docker socket (`/var/run/docker.sock`) is mounted correctly for Portainer to manage the Docker environment.
- For security, consider restricting access to the Portainer UI using Traefik's authentication middleware.
