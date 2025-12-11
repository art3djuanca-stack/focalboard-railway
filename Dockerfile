FROM mattermost/focalboard:latest

WORKDIR /app

COPY config.json /app/config.json
COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

ENV CONFIG_FILE=/app/config.json

ENTRYPOINT ["/app/entrypoint.sh"]
