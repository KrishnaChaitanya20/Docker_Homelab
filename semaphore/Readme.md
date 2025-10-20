### Prerequisites
- A Docker network named `homelab` created.

- Rename `.env.example` to `.env` and replace the placeholder values with actual values.
  As for the `SEMAPHORE_COOKIE_ENCRYPTION`, `SEMAPHORE_COOKIE_HASH`, and `SEMAPHORE_ACCESS_KEY_ENCRYPTION` ***(Same value for all three)***, you can generate new values using the following command:
  ```bash
    openssl rand -base64 32
    ```

### Steps
1. Navigate to the `semaphore` folder:
    ```bash
    cd semaphore
    ```
2. Update or modify the configuration files as needed.
3. Deploy the services using Docker Compose:
    ```bash
    docker compose up -d
    ```
    or, in the root folder:
    ```bash
    docker compose up -d semaphore
    ```
