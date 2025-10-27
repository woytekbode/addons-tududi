# Home Assistant Add-on: Tududi

A self-hosted task management tool that puts you in control. Organize your life and projects with a clear, hierarchical structure, smart recurring tasks, and seamless Telegram integration.

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]

## About

Tududi is a lightweight, self-hosted task and notes management application that runs in your Home Assistant environment. It combines the simplicity of personal task management with the power of professional project organization.

### Features

- **Task Management**: Create, update, and delete tasks with due dates and priorities
- **Subtasks**: Break down complex tasks into manageable subtasks
- **Recurring Tasks**: Comprehensive recurring task system with multiple patterns
- **Project Organization**: Organize tasks into projects and areas
- **Quick Notes**: Create and assign text notes to projects
- **Tags**: Enhance organization with custom tags
- **Telegram Integration**: Create tasks via Telegram and receive daily digests
- **Multi-Language Support**: Available in 24 languages
- **Responsive Design**: Works on desktop, tablet, and mobile

## Installation

1. Add this repository to your Home Assistant add-on store
2. Find "Tududi" in the add-on store and click Install
3. Configure the add-on with your desired settings
4. Start the add-on
5. Access Tududi at `http://homeassistant.local:3002`

## Configuration

### Required Configuration

```yaml
user_email: "admin@example.com"
user_password: "your-secure-password"
session_secret: "your-session-secret-here"
```

**Note**: Generate a session secret with this command:
```bash
openssl rand -hex 64
```

### Optional Configuration

```yaml
port: 3002
allowed_origins: ""
telegram_bot_token: ""
```

### Option: `user_email` (required)

The email address for the initial admin user. This will be used to log in to Tududi.

Example: `admin@example.com`

### Option: `user_password` (required)

The password for the initial admin user. Use a strong, secure password.

Example: `MySecurePassword123!`

### Option: `session_secret` (required)

A secret key used for session encryption. Generate using `openssl rand -hex 64`.

### Option: `port`

The port on which Tududi will be accessible.

Default: `3002`

### Option: `allowed_origins`

Controls CORS (Cross-Origin Resource Sharing) access:
- Empty string: Only allows localhost origins (most secure for local use)
- Specific domains: `https://tududi.example.com,http://localhost:3002`
- For development only: Set to allow all origins (not recommended for production)

### Option: `telegram_bot_token`

Optional Telegram bot token for Telegram integration. This allows you to:
- Create tasks via Telegram messages
- Receive daily task digests
- Quick capture of ideas on the go

To get a bot token:
1. Chat with @BotFather on Telegram
2. Create a new bot with `/newbot`
3. Copy the bot token provided

## Usage

After installation and configuration:

1. Navigate to `http://homeassistant.local:3002` (or your custom port)
2. Log in with your configured email and password
3. Start creating tasks, projects, and notes!

### Telegram Integration Setup

If you configured a Telegram bot token:

1. Log in to Tududi
2. Go to Settings → Telegram tab
3. The integration should already be active
4. Click the link to start chatting with your bot
5. Send a message to your bot - it will appear in your Tududi inbox!

## Data Persistence

All data (database and uploads) is stored in the add-on's data directory and persists across restarts and updates.

- Database: `/data/db/tududi.db`
- Uploads: `/data/uploads`

## Support

For issues, questions, or feature requests:

- [Tududi GitHub](https://github.com/chrisvel/tududi)
- [Home Assistant Community](https://community.home-assistant.io/)
- [Tududi Discord](https://discord.gg/fkbeJ9CmcH)

## Credits

Tududi is created and maintained by [Chris Veleris](https://github.com/chrisvel).

This Home Assistant add-on packages Tududi for easy integration with Home Assistant.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
