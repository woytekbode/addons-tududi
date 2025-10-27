ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install requirements for add-on
RUN \
  apk add --no-cache \
    nodejs \
    npm \
    git \
    bash \
    python3 \
    py3-pip \
    make \
    g++

# Set working directory
WORKDIR /app

# Clone Tududi repository
RUN \
  git clone --depth 1 https://github.com/chrisvel/tududi.git . \
  && rm -rf .git

# Install dependencies (including dev dependencies needed for build)
ENV PYTHON=python3
ENV NODE_ENV=development
RUN npm ci

# Build the frontend
RUN npm run build

# Set production environment and remove dev dependencies
ENV NODE_ENV=production
RUN npm prune --production

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
