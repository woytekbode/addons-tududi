#!/usr/bin/with-contenv bashio

set -e

bashio::log.info "Starting Tududi..."

# Read configuration from Home Assistant
USER_EMAIL=$(bashio::config 'user_email')
USER_PASSWORD=$(bashio::config 'user_password')
SESSION_SECRET=$(bashio::config 'session_secret')
PORT=$(bashio::config 'port')
ALLOWED_ORIGINS=$(bashio::config 'allowed_origins')
TELEGRAM_BOT_TOKEN=$(bashio::config 'telegram_bot_token')

# Validate required configuration
if bashio::var.is_empty "${USER_EMAIL}"; then
    bashio::log.fatal "User email is required! Please configure the add-on."
    exit 1
fi

if bashio::var.is_empty "${USER_PASSWORD}"; then
    bashio::log.fatal "User password is required! Please configure the add-on."
    exit 1
fi

if bashio::var.is_empty "${SESSION_SECRET}"; then
    bashio::log.fatal "Session secret is required! Please configure the add-on."
    exit 1
fi

# Set environment variables for Tududi
export TUDUDI_USER_EMAIL="${USER_EMAIL}"
export TUDUDI_USER_PASSWORD="${USER_PASSWORD}"
export TUDUDI_SESSION_SECRET="${SESSION_SECRET}"
export PORT="${PORT}"
export DB_FILE="/data/db/tududi.db"
export TUDUDI_UPLOAD_PATH="/data/uploads"

# Set allowed origins if configured
if ! bashio::var.is_empty "${ALLOWED_ORIGINS}"; then
    export TUDUDI_ALLOWED_ORIGINS="${ALLOWED_ORIGINS}"
    bashio::log.info "CORS allowed origins: ${ALLOWED_ORIGINS}"
fi

# Set Telegram bot token if configured
if ! bashio::var.is_empty "${TELEGRAM_BOT_TOKEN}"; then
    export TELEGRAM_BOT_TOKEN="${TELEGRAM_BOT_TOKEN}"
    bashio::log.info "Telegram integration enabled"
fi

# Log startup information
bashio::log.info "User email: ${USER_EMAIL}"
bashio::log.info "Port: ${PORT}"
bashio::log.info "Database: ${DB_FILE}"
bashio::log.info "Uploads: ${TUDUDI_UPLOAD_PATH}"

# Change to app directory and backend
cd /app/backend

# Start Tududi in production mode
bashio::log.info "Starting Tududi server..."
export NODE_ENV=production
exec node app.js
