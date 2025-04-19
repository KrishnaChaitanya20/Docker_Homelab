# Cloudflare Configuration

This folder contains configuration files and documentation for managing Cloudflare settings in a homelab environment.

## Purpose

This folder is used to store and version control Cloudflare-related configurations, compose files, and documentation for managing DNS, security, and other Cloudflare services in a homelab environment.

## Usage

### Prerequisites
- Access to a Cloudflare account and API keys.
- copy .env.example to .env and fill in the values.
- A Docker network named `homelab` created (or update the network name in the compose file).

### Steps
1. Navigate to the `cloudflare` folder:
    ```bash
    cd cloudflare
    ```
2. Update or modify the configuration files as needed.
3. Deploy the services using Docker Compose:
    ```bash
    docker compose up -d
    ```