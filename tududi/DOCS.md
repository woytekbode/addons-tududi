# Tududi Add-on Documentation

## Getting Started

After installing the add-on, you need to configure it with your credentials before starting.

### Initial Configuration

1. Go to the Configuration tab
2. Set the following required fields:
   - **User Email**: Your admin email (e.g., `admin@example.com`)
   - **User Password**: A secure password
   - **Session Secret**: Generate with `openssl rand -hex 64`

3. Optionally configure:
   - **Port**: Default is 3002
   - **Allowed Origins**: For CORS configuration
   - **Telegram Bot Token**: For Telegram integration

4. Click **Save**
5. Start the add-on

### Accessing Tududi

Once the add-on is running, access Tududi at:
- `http://homeassistant.local:3002` (or your configured port)
- Or use the **Open Web UI** button in the add-on page

## Features

### Task Management

Create and manage tasks with:
- Due dates and priorities
- Subtasks for complex work
- Recurring patterns (daily, weekly, monthly)
- Tags for organization
- Notes and attachments

### Projects & Areas

Organize your work hierarchically:
- **Tasks**: Individual action items
- **Projects**: Collections of related tasks
- **Areas**: Groups of projects (e.g., Work, Personal, Health)

### Telegram Integration

Connect Tududi to Telegram:

1. Create a bot via @BotFather on Telegram:
   ```
   /newbot
   ```

2. Get your bot token (format: `123456789:ABCdefGHIjklMNOpqrSTUvwxyz`)

3. Add the token to the add-on configuration

4. Start chatting with your bot - messages become inbox items in Tududi!

### Daily Digests

Enable daily task summaries via Telegram:
- Login to Tududi
- Go to Settings → Telegram
- Enable daily summaries
- Receive your task list every morning

## Configuration Examples

### Minimal Configuration

```yaml
user_email: "admin@homeassistant.local"
user_password: "MySecurePassword123!"
session_secret: "a1b2c3d4e5f6...64-character-hex-string"
port: 3002
allowed_origins: ""
telegram_bot_token: ""
```

### With Telegram Integration

```yaml
user_email: "admin@homeassistant.local"
user_password: "MySecurePassword123!"
session_secret: "a1b2c3d4e5f6...64-character-hex-string"
port: 3002
allowed_origins: ""
telegram_bot_token: "123456789:ABCdefGHIjklMNOpqrSTUvwxyz"
```

### With Custom CORS

```yaml
user_email: "admin@homeassistant.local"
user_password: "MySecurePassword123!"
session_secret: "a1b2c3d4e5f6...64-character-hex-string"
port: 3002
allowed_origins: "https://tududi.example.com,http://192.168.1.100:3002"
telegram_bot_token: ""
```

## Troubleshooting

### Add-on won't start

Check the logs for error messages. Common issues:

1. **Missing required configuration**: Ensure `user_email`, `user_password`, and `session_secret` are set
2. **Port conflict**: Change the port if 3002 is already in use
3. **Invalid session secret**: Generate a new one with `openssl rand -hex 64`

### Can't access the web interface

1. Verify the add-on is running (check logs)
2. Try accessing via IP: `http://YOUR_HA_IP:3002`
3. Check firewall settings
4. Ensure the port is not blocked

### Telegram integration not working

1. Verify your bot token is correct
2. Ensure you've started a conversation with your bot
3. Check the Telegram settings page in Tududi
4. Verify polling is active

### Data persistence

All data is stored in `/data/` and persists across:
- Add-on restarts
- Add-on updates
- Home Assistant restarts

To backup your data, backup the add-on data directory from Home Assistant.

## Advanced Usage

### Generating a Session Secret

On Linux/Mac/WSL:
```bash
openssl rand -hex 64
```

On Windows (PowerShell):
```powershell
[System.Convert]::ToBase64String([System.Security.Cryptography.RandomNumberGenerator]::GetBytes(64))
```

### Accessing Logs

View real-time logs from the add-on page:
1. Go to the add-on page
2. Click the **Log** tab
3. View startup messages and errors

### Updating the Add-on

When updates are available:
1. Go to the add-on page
2. Click **Update**
3. Your data will be preserved

## Security Considerations

- **Use strong passwords**: Especially if exposing to the internet
- **Keep session secret secure**: Never share or commit to version control
- **CORS configuration**: Keep `allowed_origins` empty unless you need external access
- **Regular backups**: Backup your Home Assistant data regularly
- **Telegram bot security**: Your bot is private by default - only you can send messages

## Support & Resources

- [Tududi Documentation](https://github.com/chrisvel/tududi)
- [Home Assistant Community](https://community.home-assistant.io/)
- [Report Issues](https://github.com/YOUR_USERNAME/addons-tududi/issues)
- [Tududi Discord](https://discord.gg/fkbeJ9CmcH)
