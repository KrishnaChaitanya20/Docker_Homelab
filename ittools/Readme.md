# IT-Tools

This folder contains the configuration for running [IT-Tools](https://github.com/corentinth/it-tools) in your homelab using Docker Compose if any.

## Purpose

IT-Tools is a collection of handy online tools for developers, sysadmins, and IT professionals. It provides utilities such as encoders/decoders, format converters, hash generators, and more—all in a single web interface.

## Usage

### Prerequisites
- Docker and Docker Compose installed
- Docker network named `homelab` (or update the network name in the compose file)

### Steps
1. Navigate to the `ittools` folder:
    ```bash
    cd ittools
    ```
2. Start the IT-Tools container:
    ```bash
    docker compose up -d
    ```
3. Access IT-Tools in your browser at:
    - http://localhost:8080
    - Or via your configured local/public domain (e.g., http://it-tools.${LOCAL_DOMAIN})

### Configuration
- The service listens on port 8080 by default (mapped to container port 80).
- To change the port, edit the `ports` section in `compose.yaml`.

## Reference
- [IT-Tools GitHub](https://github.com/corentinth/it-tools)
- [Docker Hub](https://hub.docker.com/r/corentinth/it-tools)
