# n8n Configuration

This folder contains the compose files and configuration for setting up n8n, a powerful workflow automation platform for technical people.

## Purpose

The purpose of this folder is to provide a self-hosted solution for workflow automation, allowing you to connect different services and automate tasks through a visual workflow editor.

## Usage

### Prerequisites
- A Docker network named `homelab` must exist.
- Set up `LOCAL_DOMAIN` and `PUBLIC_DOMAIN` domain variables either as system variables or in a `.env` file. The `.env` file should be in the same directory as the compose file and should be included in the compose file. The variables are used to route traffic from the Traefik service to the n8n service. The `.env` file should look like this:
    ```bash
    LOCAL_DOMAIN=localdomain.com
    PUBLIC_DOMAIN=publicdomain.com
    ```

### Steps
1. Navigate to the `n8n` folder:
    ```bash
    cd n8n
    ```

2. Deploy the n8n service using Docker Compose:
    ```bash
    docker compose up -d
    ```

3. Access the n8n interface at:
    - `http://n8n.${LOCAL_DOMAIN}`
    - `http://n8n.${PUBLIC_DOMAIN}`

### Initial Setup
- On first access, n8n will guide you through the initial setup process
- Create your admin account with email and password
- Configure your workspace settings
- Start building your first workflow

### Features
- **Visual Workflow Editor**: Create complex automations with a drag-and-drop interface
- **400+ Integrations**: Connect to popular services like Google Sheets, Slack, GitHub, and more
- **Custom Code**: Write JavaScript functions for advanced logic
- **Webhooks**: Trigger workflows from external services
- **Scheduling**: Run workflows on a schedule using cron expressions
- **Error Handling**: Built-in error handling and retry mechanisms

### Notes
- The `/home/node/.n8n` directory will store persistent data including workflows, credentials, and settings.
- The `./local-files` directory is mapped to `/files` inside the container for file operations.
- Webhooks are configured to use the public domain for external service integration.
- n8n runs in production mode with enhanced security settings.
- The service includes runner capabilities for improved performance with complex workflows.
- For security, ensure proper authentication is configured, especially if exposing to the internet.
- Consider setting up SSL/TLS certificates for production use with sensitive data.
- Regular backups of the n8n data directory are recommended to preserve your workflows and configurations.