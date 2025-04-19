# Homepage Configuration

This folder contains the compose files and configuration folder for setting up the homepage, a dashboard for the homelab.

## Purpose

The purpose of this folder is to provide a dashboard for homelab services, featuring links to each service and a search bar.

## Usage

### Prerequisites
- Update the links to services in the YAML files inside the `config` folder, or else widgets and hrefs won't work. 
- Ensure the Pi-hole service is up and running. 
- Add a record in the local DNS (e.g., for Pi-hole setup, create a CNAME record `dashboard.${local_domain}` pointing to `${local_domain}`).
- A Docker network named `homelab` must exist.
- Set up `LOCAL_DOMAIN` and `PUBLIC_DOMAIN` domain variables wither as system variables or in a `.env` file. The `.env` file should be in the same directory as the compose file and should be included in compose file. The variables are used to route traffic from traefik service to the dashboard service. The `.env` file should look like this:
    ```bash
    LOCAL_DOMAIN=localdomain.com
    PUBLIC_DOMAIN=publicdomain.com
    ```
### Steps
1. Navigate to the `homepage` folder:
    ```bash
    cd homepage
    ```
2. Deploy the services using Docker Compose:
    ```bash
    docker compose up -d
    ```
3. Access the dashboard at:
    - `http://dashboard.${local_domain}`
    - `http://dashboard.${public_domain}`
