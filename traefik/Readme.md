# Traefik Configuration

This folder contains the compose files and configuration for setting up Traefik, a modern reverse proxy and load balancer.

## Purpose

The purpose of this folder is to provide a self-hosted solution for routing and load balancing traffic to various services in the homelab.

## Usage

### Prerequisites
- A Docker network named `homelab` must exist.
- Set up `LOCAL_DOMAIN` and `PUBLIC_DOMAIN` domain variables either as system variables or in a `.env` file. The `.env` file should be in the same directory as the compose file and should be included in the compose file. The variables are used to route traffic to services. The `.env` file should look like this:
    ```bash
    LOCAL_DOMAIN=localdomain.com
    PUBLIC_DOMAIN=publicdomain.com
    ```

### Steps
1. Navigate to the `traefik` folder:
    ```bash
    cd traefik
    ```

2. Deploy the Traefik service using Docker Compose:
    ```bash
    docker compose up -d
    ```

3. Access the Traefik dashboard at:
    - `http://traefik.${LOCAL_DOMAIN}`
    - `http://traefik.${PUBLIC_DOMAIN}`

### Notes
- The Traefik service is configured to use the `homelab` network and dynamically discover services with appropriate labels.
- The Traefik dashboard is exposed via the `traefik.${LOCAL_DOMAIN}` and `traefik.${PUBLIC_DOMAIN}` routes.
- For production environments, consider securing the Traefik dashboard by enabling authentication and HTTPS.
