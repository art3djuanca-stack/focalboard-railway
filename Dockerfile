FROM mattermost/focalboard:latest

# Copy config and entrypoint into the container
COPY config.json /opt/focalboard/config.json
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
