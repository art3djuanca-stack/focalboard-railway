FROM debian:bookworm-slim

WORKDIR /opt/focalboard

RUN apt-get update &&     apt-get install -y curl tar ca-certificates &&     rm -rf /var/lib/apt/lists/*

# Download Focalboard v0.14.0
RUN curl -L -o focalboard.tar.gz https://github.com/mattermost/focalboard/releases/download/v0.14.0/focalboard-server-linux-amd64.tar.gz &&     tar -xzf focalboard.tar.gz &&     mv focalboard-server-linux-amd64/* . &&     chmod +x ./focalboard-server &&     rm -rf focalboard.tar.gz focalboard-server-linux-amd64

COPY config.json /opt/focalboard/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]
