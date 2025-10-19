# Kestra Configuration

This folder contains the compose files and configuration for setting up Kestra, a data orchestration and workflow management platform.

## Purpose

The purpose of this folder is to provide a self-hosted solution for managing workflows and data pipelines using Kestra.

## Usage

### Prerequisites
- A Docker network named `homelab` must exist.
- Set up `LOCAL_DOMAIN` and `PUBLIC_DOMAIN` domain variables either as system variables or in a `.env` file. The `.env` file should be in the same directory as the compose file and should be included in the compose file. The variables are used to route traffic from the Traefik service to the Kestra service. The `.env` file should look like this:
    ```bash
    LOCAL_DOMAIN=localdomain.com
    PUBLIC_DOMAIN=publicdomain.com
    ```

### Steps
1. Navigate to the `kestra` folder:
    ```bash
    cd kestra
    ```

2. Deploy the Kestra service using Docker Compose:
    ```bash
    docker compose up -d
    ```

3. Access the Kestra server at:
    - `http://kestra.${LOCAL_DOMAIN}`
    - `http://kestra.${PUBLIC_DOMAIN}`

### Notes
- The `kestra-data` volume is used to store Kestra's database and other persistent data.
- The `kestra/configuration` is defined inline in the `docker-compose` file under the `KESTRA_CONFIGURATION` environment variable. Modify it as needed for your setup.
- Ensure sufficient resources (CPU, memory, and storage) are allocated to the Kestra container for optimal performance.
