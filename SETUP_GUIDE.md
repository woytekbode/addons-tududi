# Complete Setup Guide for Tududi Home Assistant Add-on

This guide will walk you through setting up the Tududi Home Assistant add-on from scratch, including creating a GitHub repository and publishing the add-on.

## Prerequisites

- A GitHub account
- Git installed on your computer
- Home Assistant instance running
- Basic familiarity with the command line

## Step 1: Set Up GitHub Repository

### 1.1 Create a New GitHub Repository

1. Go to [GitHub](https://github.com) and log in
2. Click the **+** icon in the top right and select **New repository**
3. Fill in the details:
   - **Repository name**: `addons-tududi` (or your preferred name)
   - **Description**: "Home Assistant add-on for Tududi task management"
   - **Visibility**: Public (required for Home Assistant add-ons)
   - **Initialize**: Don't initialize with README (we already have files)
4. Click **Create repository**

### 1.2 Update Your Files

Before pushing to GitHub, update these files with your information:

1. **README.md** - Replace `YOUR_USERNAME` with your GitHub username
2. **repository.yaml** - Update:
   - `url`: Your GitHub repository URL
   - `maintainer`: Your name and email
3. **tududi/config.yaml** - Replace `YOUR_USERNAME` in the image field
4. **tududi/build.yaml** - Update the source URL
5. **tududi/README.md** - Replace `YOUR_USERNAME`
6. **tududi/DOCS.md** - Update any URLs if needed
7. **LICENSE** - Add your name and year

### 1.3 Initialize Git and Push to GitHub

Open PowerShell in your project directory (`c:\Users\Woytek.Bode\addons-tududi`) and run:

```powershell
# Initialize git repository
git init

# Add all files
git add .

# Make your first commit
git commit -m "Initial commit: Tududi Home Assistant add-on"

# Add your GitHub repository as remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/addons-tududi.git

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

## Step 2: Set Up GitHub Container Registry

The add-on uses GitHub Container Registry (GHCR) to store Docker images.

### 2.1 Enable GitHub Actions

1. Go to your repository on GitHub
2. Click **Settings** → **Actions** → **General**
3. Under "Workflow permissions":
   - Select **Read and write permissions**
   - Check **Allow GitHub Actions to create and approve pull requests**
4. Click **Save**

### 2.2 Trigger First Build

The GitHub Actions workflow will automatically build your add-on:

1. Make a small change (e.g., update README.md)
2. Commit and push:
   ```powershell
   git add .
   git commit -m "Trigger first build"
   git push
   ```
3. Go to **Actions** tab on GitHub to watch the build
4. Wait for builds to complete (this may take 15-30 minutes for all architectures)

## Step 3: Add Icon and Logo Images

Create or download proper icons for your add-on:

1. Create/find a 256x256 PNG image
2. Save it as both `icon.png` and `logo.png` in the `tududi/` directory
3. Commit and push:
   ```powershell
   git add tududi/icon.png tududi/logo.png
   git commit -m "Add icon and logo images"
   git push
   ```

## Step 4: Install in Home Assistant

### 4.1 Add Repository to Home Assistant

1. Open your Home Assistant instance
2. Go to **Settings** → **Add-ons** → **Add-on Store**
3. Click the **⋮** (three dots) in the top right
4. Select **Repositories**
5. Add your repository URL:
   ```
   https://github.com/YOUR_USERNAME/addons-tududi
   ```
6. Click **Add** → **Close**

### 4.2 Install the Add-on

1. Refresh the Add-on Store page
2. Scroll down to find "Tududi" under your repository
3. Click on it
4. Click **Install**
5. Wait for installation to complete

### 4.3 Configure the Add-on

1. Go to the **Configuration** tab
2. Set required fields:
   ```yaml
   user_email: "your-email@example.com"
   user_password: "YourSecurePassword123!"
   session_secret: "generate-this-below"
   port: 3002
   ```

3. Generate a session secret:
   - On Windows PowerShell:
     ```powershell
     -join ((48..57) + (65..90) + (97..122) | Get-Random -Count 64 | % {[char]$_})
     ```
   - Or use an online generator: https://www.random.org/strings/

4. (Optional) Add Telegram bot token if you want Telegram integration

5. Click **Save**

### 4.4 Start the Add-on

1. Go to the **Info** tab
2. Click **Start**
3. Wait for it to start (check **Log** tab for progress)
4. Click **Open Web UI** or navigate to `http://homeassistant.local:3002`

## Step 5: First Login

1. Open the Tududi web interface
2. Log in with your configured email and password
3. Start creating tasks and projects!

## Step 6: Enable Telegram Integration (Optional)

### 6.1 Create a Telegram Bot

1. Open Telegram and search for **@BotFather**
2. Start a chat and send: `/newbot`
3. Follow the prompts:
   - Choose a name (e.g., "My Tududi Bot")
   - Choose a username (e.g., "mytududi_bot")
4. Copy the bot token (format: `123456789:ABCdefGHIjklMNOpqrSTUvwxyz`)

### 6.2 Configure in Home Assistant

1. Stop the Tududi add-on
2. Go to **Configuration** tab
3. Add your bot token to `telegram_bot_token`
4. Click **Save**
5. Start the add-on

### 6.3 Start Using Telegram

1. Search for your bot in Telegram (use the username from step 6.1)
2. Start a chat
3. Send a message - it will appear in your Tududi inbox!

## Troubleshooting

### Add-on won't start

1. Check the **Log** tab for errors
2. Verify all required configuration is set
3. Ensure session_secret is at least 32 characters
4. Try changing the port if 3002 is in use

### Can't access web interface

1. Verify the add-on is running
2. Check your Home Assistant's IP address
3. Try: `http://YOUR_HA_IP:3002`
4. Check firewall settings

### Build failures on GitHub

1. Check the Actions tab for error details
2. Ensure all placeholder text (`YOUR_USERNAME`) is replaced
3. Verify `build.yaml` and `config.yaml` syntax
4. Check Docker Hub credentials if using custom registry

### Repository not showing in Home Assistant

1. Verify repository URL is correct
2. Ensure repository is **public**
3. Check that `repository.yaml` exists in root
4. Wait a few minutes and refresh

## Advanced: Local Development

To test the add-on locally before pushing to GitHub:

### Using VS Code DevContainer

1. Install Docker Desktop
2. Install VS Code with Remote-Containers extension
3. Open the project folder in VS Code
4. Click "Reopen in Container" when prompted
5. Use the integrated terminal to build and test

### Manual Docker Build

```powershell
# Build for your architecture (e.g., amd64)
docker build -t local/tududi-test --build-arg BUILD_FROM="ghcr.io/home-assistant/amd64-base:3.19" ./tududi

# Run locally
docker run --rm -p 3002:3002 `
  -e TUDUDI_USER_EMAIL="test@example.com" `
  -e TUDUDI_USER_PASSWORD="password123" `
  -e TUDUDI_SESSION_SECRET="test-secret-key-at-least-32-chars" `
  local/tududi-test
```

## Updating Your Add-on

When you want to release updates:

1. Make changes to your files
2. Update version in `tududi/config.yaml`
3. Commit and push:
   ```powershell
   git add .
   git commit -m "Update to version X.Y.Z"
   git push
   ```
4. GitHub Actions will rebuild automatically
5. Users can update from the Add-on Store

## Additional Resources

- [Home Assistant Add-on Documentation](https://developers.home-assistant.io/docs/add-ons)
- [Tududi Documentation](https://github.com/chrisvel/tududi)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Docker Documentation](https://docs.docker.com/)

## Getting Help

- [Home Assistant Community Forums](https://community.home-assistant.io/)
- [Tududi Discord](https://discord.gg/fkbeJ9CmcH)
- Open an issue on your GitHub repository

---

Congratulations! You've successfully set up a Home Assistant add-on for Tududi! 🎉
