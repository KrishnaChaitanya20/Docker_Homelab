### Prerequisites
- A Docker network named `homelab` created.

### Steps
1. Navigate to the `grafana` folder:
    ```bash
    cd grafana
    ```
2. Update or modify the configuration files as needed.
3. Deploy the services using Docker Compose:
    ```bash
    docker compose up -d
    ```
    or, in the root folder:
    ```bash
    docker compose up -d grafana
    ```

### ( Optional ) Grafana MCP Setup
> Deploy this alongside Grafana when you are n8n AI agent with grafana-mcp server or any other AI integration that requires Grafana MCP.
In `grafana` folder to run grafana mcp use:
```bash
docker compose up -d grafana grafana-mcp
```
or, in the root folder:
```bash
docker compose up -d grafana grafana-mcp
                #or
docker compose --profile grafana-mcp up -d
```
