### Prerequisites
- A Docker network named `homelab` created.

### Steps
1. Navigate to the `prometheus` folder:
    ```bash
    cd prometheus
    ```
2. Update or modify the configuration files (compose.yaml and prometheus.yaml) as needed.
    - Add or remove scrape targets in `prometheus.yaml` to monitor different services.
    - or uncomment the docker_sd_configs section to enable automatic service discovery within the `homelab` Docker network.
3. Deploy the services using Docker Compose:
    ```bash
    docker compose up -d
    ```
    or, in the root folder:
    ```bash
    docker compose up -d prometheus
    ```