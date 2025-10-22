### Prerequisites
- A Docker network named `homelab` created.
 
### Steps
1. Navigate to the `homepage` folder:
    ```bash
    cd homepage
    ```
2. Update or modify the configuration files as needed.
3. Deploy the services using Docker Compose:
    ```bash
    docker compose up -d
    ```
    or, in the root folder:
    ```bash
    docker compose up -d homepage
    ```
4. A folder named `config` is generated in the `homepage` directory.Customize the dashboard by adding widgets and other configurations in appropriate yaml files. Check out the [documentation](https://gethomepage.dev/configs/).