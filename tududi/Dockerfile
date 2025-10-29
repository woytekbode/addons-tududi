# Stage 1: Get the official Tududi image
FROM chrisvel/tududi:v0.84.2 AS tududi-source

# Stage 2: Build the Home Assistant add-on
ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install only runtime requirements (no build tools needed!)
RUN \
  apk add --no-cache \
    nodejs \
    npm \
    bash

# Set working directory
WORKDIR /app

# Copy the pre-built Tududi application from official image
COPY --from=tududi-source /app /app

# Create data directories
RUN mkdir -p /data/db /data/uploads

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

# Expose port
EXPOSE 3002

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:3002/ || exit 1

CMD ["/run.sh"]
