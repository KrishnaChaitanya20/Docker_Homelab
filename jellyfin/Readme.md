# Jellyfin Configuration

This folder contains the compose files and configuration for setting up Jellyfin, a media server for streaming movies, TV shows, and other media.

## Purpose

The purpose of this folder is to provide a self-hosted media server solution using Jellyfin, allowing users to organize and stream their media library.

## Usage

### Prerequisites
- A Docker network named `homelab` must exist.
-  create and folder called movies or change the compose file to use docker volumes instead of bind mounts.
- Set up `LOCAL_DOMAIN` and `PUBLIC_DOMAIN` domain variables either as system variables or in a `.env` file. The `.env` file should be in the same directory as the compose file and should be included in the compose file. The variables are used to route traffic from the Traefik service to the Jellyfin service. The `.env` file should look like this:
    ```bash
    LOCAL_DOMAIN=localdomain.com
    PUBLIC_DOMAIN=publicdomain.com
    ```

### Steps
1. Navigate to the `jellyfin` folder:
    ```bash
    cd jellyfin
    ```

2. Deploy the Jellyfin service using Docker Compose:
    ```bash
    docker compose up -d
    ```

3. Access the Jellyfin server at:
    - `http://jellyfin.${LOCAL_DOMAIN}`
    - `http://jellyfin.${PUBLIC_DOMAIN}`

### Notes
- **Important:** This service is not intended to stream media over a Cloudflare Tunnel. The primary purpose of a Cloudflare Tunnel is to serve HTML-based content. Accessing the service over the public domain is recommended only for managing the service, not for streaming media.
- Ensure that media files are placed in the `jellyfin/movies` directory or other configured media directories.
- The `jellyfin/config` and `jellyfin/cache` directories will be automatically populated by Jellyfin during runtime.
- For optimal performance, ensure sufficient storage and memory resources are allocated to the Jellyfin container.

