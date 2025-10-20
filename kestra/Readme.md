### Prerequisites
- A Docker network named `homelab` created.

- **(Optional)** If you want to use AI features: Rename `.env.example` to `.env` and replace the placeholder value with actual gemini api key.

  -  uncomment the ai configuration in `compose.yaml` if you want to use the ai features.

> My setup configures kestra to use file based h2 database. You can change this to use other databases by modifying the configuration.

### Steps
1. Navigate to the `kestra` folder:
    ```bash
    cd kestra
    ```
2. Update or modify the configuration files as needed.
3. Deploy the services using Docker Compose:
    ```bash
    docker compose up -d
    ```
    or, in the root folder:
    ```bash
    docker compose up -d kestra
    ```
