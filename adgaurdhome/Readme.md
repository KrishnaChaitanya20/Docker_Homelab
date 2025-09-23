# AdGuard Home Configuration

This folder contains the compose files and configuration for setting up AdGuard Home, a network-wide ad blocker and DNS privacy server.

## Purpose

The purpose of this folder is to provide a self-hosted solution for blocking ads, tracking, and malicious websites at the network level while serving as a secure DNS resolver with privacy protection features.

## Usage

### Prerequisites
- A Docker network named `homelab` must exist.
- Set up `LOCAL_DOMAIN` and `PUBLIC_DOMAIN` domain variables either as system variables or in a `.env` file. The `.env` file should be in the same directory as the compose file and should be included in the compose file. The variables are used to route traffic from the Traefik service to the AdGuard Home service. The `.env` file should look like this:
    ```bash
    LOCAL_DOMAIN=localdomain.com
    PUBLIC_DOMAIN=publicdomain.com
    ```

### Steps
1. Navigate to the `adgaurdhome` folder:
    ```bash
    cd adgaurdhome
    ```

2. Deploy the AdGuard Home service using Docker Compose:
    ```bash
    docker compose up -d
    ```

3. Access the AdGuard Home admin interface at:
    - `http://adguard.${LOCAL_DOMAIN}`
    - `http://adguard.${PUBLIC_DOMAIN}`
    - Or directly at `http://localhost:3000` during initial setup

### Initial Setup
- On first access, AdGuard Home will guide you through the initial setup wizard
- Configure your admin username and password
- Set up DNS servers (recommended: Cloudflare 1.1.1.1, Quad9 9.9.9.9)
- Configure filtering settings and blocklists

### Notes
- The `adgaurdhome/work` directory will store persistent data including query logs, statistics, and filter databases.
- The `adgaurdhome/config` directory will store configuration files including settings and custom rules.
- Ensure that the AdGuard Home container has sufficient permissions to bind to port 53 for DNS resolution.
- Update the DNS settings on your router or devices to point to the AdGuard Home container's IP address for network-wide ad blocking.
- AdGuard Home provides more advanced features compared to Pi-hole, including DNS-over-HTTPS, DNS-over-TLS, and detailed query analytics.
- For optimal performance, allocate sufficient resources to the AdGuard Home container.
- Consider setting up upstream DNS servers with encryption for enhanced privacy.
