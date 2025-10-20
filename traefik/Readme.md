### Prerequisites
- A Docker network named `homelab` created.

### Steps
1. Navigate to the `traefik` folder:
    ```bash
    cd traefik
    ```

2. Deploy the Traefik service using Docker Compose:
    ```bash
    docker compose up -d
    ```

3. Access the Traefik dashboard at:
    - `http://traefik.${LOCAL_DOMAIN}`
    - `http://traefik.${PUBLIC_DOMAIN}`

4. (Optional) If you want to use HTTPs for local domain, create a certs folder in the traefik directory and add your certificates there and uncomment the relevant lines in the `compose.yaml` file.
    > Generate self-signed certificates for local domain using openssl with names local.crt and local.key and place them in certs folder.