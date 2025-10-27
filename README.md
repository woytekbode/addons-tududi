# Tududi Home Assistant Add-on Repository

This repository contains the Tududi add-on for Home Assistant.

## Add-ons

This repository contains the following add-on:

### Tududi

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]

A self-hosted task management tool that puts you in control. Organize your life and projects with a clear, hierarchical structure, smart recurring tasks, and seamless Telegram integration.

**Note:** This add-on supports only 64-bit architectures (aarch64 and amd64) due to dependencies requiring modern JavaScript runtime support.

## Installation

1. Click the button below to add this repository to your Home Assistant instance:

   [![Add Repository to Home Assistant][add-repo-shield]][add-repo]

   Or add manually: Navigate to **Supervisor** → **Add-on Store** → **⋮** (three dots in the top right) → **Repositories**, and add the URL:
   ```
   https://github.com/woytekbode/addons-tududi
   ```

2. Find "Tududi" in the add-on store and click **Install**
3. Configure the add-on (see configuration options below)
4. Click **Start**
5. Access Tududi through the web UI on port 3002

## Configuration

The add-on requires initial configuration before first use:

```yaml
user_email: "admin@example.com"
user_password: "your-secure-password"
session_secret: "generate-with-openssl-rand-hex-64"
port: 3002
allowed_origins: ""
telegram_bot_token: ""
```

### Option: `user_email` (required)
Initial admin user's lp address for first login.

### Option: `user_password` (required)
Initial admin user's password. Use a strong password!

### Option: `session_secret` (required)
Session encryption key. Generate with: `openssl rand -hex 64`

### Option: `port`
The port on which Tududi will be available (default: 3002).

### Option: `allowed_origins`
Controls CORS access. Leave empty for localhost only, or specify domains like `https://tududi.example.com`.

### Option: `telegram_bot_token`
Optional. Your Telegram bot token for Telegram integration.

## Support

For issues, questions, or feature requests:
- [GitHub Issues](https://github.com/woytekbode/addons-tududi/issues)
- [Tududi Project](https://github.com/chrisvel/tududi)
- [Home Assistant Community](https://community.home-assistant.io/)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[add-repo-shield]: https://img.shields.io/badge/Add%20Repository-41BDF5?style=for-the-badge&logo=home-assistant&logoColor=white
[add-repo]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fwoytekbode%2Faddons-tududi
