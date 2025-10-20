### Prerequisites
- Create a Cloudflare account (If you don't have one).
- In ZeroTrust Dashboard, Create a Tunnel and download the credentials file.
- In the tunnel routing setting, add the protocol as `HTTP` and the destination address as `traefik`.
- Under DNS settings, create a CNAME record for your desired wildcard subdomain pointing to the tunnel created.
- A Docker network named `homelab` created.

- Rename `.env.example` to `.env` and replace the placeholder values with your Cloudflare credentials and any other required variables:

    ```bash
    cp .env.example .env
    # then edit .env to set values like:
    # CF_API_TOKEN=your_token_here
    ```


### Steps
1. Navigate to the `cloudflare` folder:
    ```bash
    cd cloudflare
    ```
2. Update or modify the configuration files as needed.
3. Deploy the services using Docker Compose:
    ```bash
    docker compose up -d
    ```
    or, in the root folder:
    ```bash
    docker compose --profile public up -d
    or
    docker compose up -d cloudflare
    ```
