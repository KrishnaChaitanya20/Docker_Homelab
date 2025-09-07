# Homelab Setup

This repository contains Docker Compose files and configurations for setting up a homelab environment. The setup is modular, allowing you to manage and deploy services independently.

## Services

The following services are part of the homelab setup:

- **Cloudflare Tunnel**: Provides secure access to the homelab from the internet.
  - Folder: `cloudflare`
  - Purpose: Exposes services securely using Cloudflare's tunneling service.

- **Homepage**: A customizable dashboard for accessing and managing homelab services.
  - Folder: `homepage`
  - Purpose: Displays links to services and provides a search bar for convenience.

- **Jellyfin**: A media server for streaming personal media.
  - Folder: `jellyfin`
  - Purpose: Organizes and streams movies, TV shows, and other media.

- **IT-Tools**: A collection of useful online tools for developers and IT professionals.
  - Folder: `ittools`
  - Purpose: Provides a web interface with various utilities such as encoders, decoders, format converters, and more.

- **Kestra**: A workflow orchestration tool for managing data pipelines.
  - Folder: `kestra`
  - Purpose: Enables experimentation with workflows and data orchestration.

- **Pi-hole**: A network-wide ad blocker and DNS server.
  - Folder: `pihole`
  - Purpose: Blocks ads and tracking at the network level while serving as a local DNS resolver.

- **Portainer**: A web-based interface for managing Docker containers and stacks.
  - Folder: `portainer`
  - Purpose: Simplifies Docker management with an intuitive UI.

- **Traefik**: A reverse proxy and load balancer for routing traffic to services.
  - Folder: `traefik`
  - Purpose: Routes and secures traffic to homelab services.

## Features

- **Modular Setup**: Each service is defined in its own folder with a dedicated `docker-compose.yaml` file.
- **Customizable**: Easily add or remove services based on your needs.
- **Secure Access**: Uses Cloudflare Tunnel and Traefik for secure and efficient routing.

## Prerequisites

1. **Docker and Docker Compose**:
   Ensure Docker and Docker Compose are installed. Verify installation with:
   ```bash
   docker --version
   docker-compose --version
   ```

2. **Docker Network**:
   Create a Docker network named `homelab`:
   ```bash
   docker network create homelab
   ```

3. **Environment Variables**:
   - Define `LOCAL_DOMAIN` and `PUBLIC_DOMAIN` in a `.env` file or as system variables.
   - Example `.env` file:
     ```bash
     LOCAL_DOMAIN=localdomain.com
     PUBLIC_DOMAIN=publicdomain.com
     ```

4. **DNS Configuration**:
   - Add DNS records in Pi-hole for each service in the format `service.${LOCAL_DOMAIN}`.
   - Ensure `PUBLIC_DOMAIN` is properly configured in Cloudflare.

## Usage

### Starting and Managing Services with `homelab.bat`

The `homelab.bat` script simplifies managing the homelab services. It accepts the following arguments:

1. **`all`**: Starts all services defined in the Docker Compose files.
    ```bash
    homelab.bat all
    ```

2. **`up`**: Prompts the user (`Y/n`) before starting each service individually.
    ```bash
    homelab.bat up
    ```

3. **`down`**: Stops all running services.
    ```bash
    homelab.bat down
    ```

### Accessing Services
Each service is accessible via:
- `http://service.${LOCAL_DOMAIN}`
- `http://service.${PUBLIC_DOMAIN}`

Refer to the `Readme.md` file in each service folder for specific details.

> ### Notes

- This setup is for personal use and experimentation. It may not follow production-grade best practices.
- Contributions and suggestions are welcome to improve the setup.

---
