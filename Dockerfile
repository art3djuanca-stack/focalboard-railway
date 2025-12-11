FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
RUN mkdir -p /opt/focalboard
WORKDIR /opt/focalboard

# Download Focalboard Server Edition (v0.13.1)
RUN curl -L -o focalboard.zip https://github.com/mattermost/focalboard/releases/download/v0.13.1/focalboard-server-linux-amd64.zip \
    && unzip focalboard.zip \
    && rm focalboard.zip \
    && chmod +x /opt/focalboard/bin/focalboard-server

# Copy config + entrypoint
COPY config.json /opt/focalboard/config.json
COPY entrypoint.sh /opt/focalboard/entrypoint.sh
RUN chmod +x /opt/focalboard/entrypoint.sh

EXPOSE 8000
ENTRYPOINT ["/opt/focalboard/entrypoint.sh"]
