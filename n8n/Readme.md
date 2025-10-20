### Prerequisites
- A Docker network named `homelab` created.

### Steps
1. Navigate to the `n8n` folder:
    ```bash
    cd n8n
    ```
2. Update or modify the configuration files as needed.
3. Deploy the services using Docker Compose:
    ```bash
    docker compose up -d
    ```
    or, in the root folder:
    ```bash
    docker compose up -d n8n
    ```
