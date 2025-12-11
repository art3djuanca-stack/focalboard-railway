FROM mattermost/mattermost-team-edition:latest

WORKDIR /mattermost

COPY config.json /mattermost/config/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8065

ENTRYPOINT ["/entrypoint.sh"]
