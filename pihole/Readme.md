# Pi-hole Configuration

This folder contains the compose files and configuration for setting up Pi-hole, a network-wide ad blocker and DNS service.

## Purpose

The purpose of this folder is to provide a self-hosted solution for blocking ads and tracking at the network level while serving as a local DNS resolver.

## Usage

### Prerequisites
- A Docker network named `homelab` must exist.
- Set up `LOCAL_DOMAIN` and `PUBLIC_DOMAIN` domain variables either as system variables or in a `.env` file. The `.env` file should be in the same directory as the compose file and should be included in the compose file. The variables are used to route traffic from the Traefik service to the Pi-hole service. The `.env` file should look like this:
    ```bash
    LOCAL_DOMAIN=localdomain.com
    PUBLIC_DOMAIN=publicdomain.com
    ```

### Steps
1. Navigate to the `pihole` folder:
    ```bash
    cd pihole
    ```

2. Deploy the Pi-hole service using Docker Compose:
    ```bash
    docker compose up -d
    ```

3. Access the Pi-hole admin interface at:
    - `http://pihole.${LOCAL_DOMAIN}/admin`
    - `http://pihole.${PUBLIC_DOMAIN}/admin`

### Notes
- The `pihole/conf` directory will store persistent configuration data for Pi-hole.
- Ensure that the Pi-hole container has sufficient permissions to bind to port 53 for DNS resolution.
- Update the DNS settings on your router or devices to point to the Pi-hole container's IP address for network-wide ad blocking.
- For optimal performance, allocate sufficient resources to the Pi-hole container.
