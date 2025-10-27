# ✅ Next Steps - Your Add-on is Almost Ready!

Your code has been successfully pushed to GitHub! Here's what to do next:

## 1. Enable GitHub Actions (REQUIRED - 2 minutes)

GitHub Actions will automatically build Docker images for all architectures (amd64, aarch64, armv7, etc.).

### Steps:
1. Go to: **https://github.com/woytekbode/addons-tududi/settings/actions**
2. Scroll to **"Workflow permissions"**
3. Select: ✅ **"Read and write permissions"**
4. Check: ✅ **"Allow GitHub Actions to create and approve pull requests"**
5. Click **"Save"**

### Verify the Build:
- Go to: **https://github.com/woytekbode/addons-tududi/actions**
- You should see workflows running
- Wait for all builds to complete (15-30 minutes for first build)
- All 5 architectures should build successfully: amd64, aarch64, armhf, armv7, i386

## 2. Add Icon Images (OPTIONAL - 5 minutes)

The add-on currently has placeholder icons. To make it look professional:

1. Find or create a 256x256 PNG image (task/checklist icon)
2. Replace these files:
   - `tududi/icon.png`
   - `tududi/logo.png`
3. Commit and push:
   ```powershell
   git add tududi/icon.png tududi/logo.png
   git commit -m "Add proper icon and logo"
   git push
   ```

**Icon suggestions:**
- Use a checklist or task list icon
- Make it simple and recognizable
- PNG format with transparent background
- 256x256 pixels

## 3. Install in Home Assistant (10 minutes)

Once GitHub Actions builds complete:

### 3.1 Add Repository
1. Open your Home Assistant
2. Go to **Settings** → **Add-ons** → **Add-on Store**
3. Click **⋮** (three dots, top right)
4. Select **Repositories**
5. Add: `https://github.com/woytekbode/addons-tududi`
6. Click **Add** → **Close**

### 3.2 Install Add-on
1. Refresh the Add-on Store
2. Scroll down to find **"Tududi"**
3. Click on it
4. Click **Install**
5. Wait for installation to complete

### 3.3 Configure
1. Go to **Configuration** tab
2. Set these required fields:
   ```yaml
   user_email: "your-email@example.com"
   user_password: "YourSecurePassword123!"
   session_secret: "generate-using-command-below"
   port: 3002
   ```

**Generate session secret in PowerShell:**
```powershell
-join ((48..57) + (65..90) + (97..122) | Get-Random -Count 64 | % {[char]$_})
```

3. Click **Save**

### 3.4 Start
1. Go to **Info** tab
2. Click **Start**
3. Watch the **Log** tab for startup messages
4. Click **Open Web UI** when ready

### 3.5 First Login
- Navigate to: `http://homeassistant.local:3002`
- Login with your configured email and password
- Start creating tasks! 🎉

## 4. Optional: Telegram Integration

To add Telegram integration:

### Create Bot:
1. Open Telegram, search for **@BotFather**
2. Send: `/newbot`
3. Follow prompts to create your bot
4. Copy the bot token

### Configure:
1. Stop Tududi add-on
2. In **Configuration** tab, add:
   ```yaml
   telegram_bot_token: "YOUR_BOT_TOKEN_HERE"
   ```
3. Save and restart add-on
4. In Telegram, search for your bot and start chatting
5. Messages will appear in Tududi inbox!

## 5. Troubleshooting

### Builds failing?
- Check: https://github.com/woytekbode/addons-tududi/actions
- Look at the error logs in failed jobs
- Common issues:
  - Workflow permissions not set (see step 1)
  - Syntax errors in YAML files

### Add-on won't start?
- Check the **Log** tab in Home Assistant
- Verify all required configuration is set
- Ensure session_secret is at least 32 characters
- Try a different port if 3002 is in use

### Can't find add-on in store?
- Verify repository URL is correct
- Ensure repository is **public** on GitHub
- Wait a few minutes and refresh
- Check that builds completed successfully

### Web UI not accessible?
- Verify add-on is running (green status)
- Try: `http://YOUR_HA_IP:3002`
- Check firewall settings
- Look for errors in the Log tab

## 6. Updating the Add-on

When you make changes:

```powershell
# Make your changes to files
git add .
git commit -m "Description of changes"
git push

# Update version in tududi/config.yaml
# GitHub Actions will rebuild automatically
```

## Quick Links

- **Your Repository**: https://github.com/woytekbode/addons-tududi
- **GitHub Actions**: https://github.com/woytekbode/addons-tududi/actions
- **Settings**: https://github.com/woytekbode/addons-tududi/settings
- **Issues**: https://github.com/woytekbode/addons-tududi/issues
- **Tududi Project**: https://github.com/chrisvel/tududi

## Support

- 📖 Full setup guide: See `SETUP_GUIDE.md`
- 📚 User docs: See `tududi/DOCS.md`
- 💬 Home Assistant Community: https://community.home-assistant.io/
- 🎮 Tududi Discord: https://discord.gg/fkbeJ9CmcH

---

**Current Status:**
- ✅ Repository created
- ✅ Code pushed to GitHub
- ⏳ Waiting: GitHub Actions setup
- ⏳ Pending: Add-on installation

**Next immediate action:** Go to https://github.com/woytekbode/addons-tududi/settings/actions and enable workflow permissions!
