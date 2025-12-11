#!/bin/sh
echo "Configuring Focalboard..."
if [ -n "$DATABASE_URL" ]; then
  sed -i "s|POSTGRES_URL|$DATABASE_URL|g" /opt/focalboard/config.json
fi

echo "Starting Focalboard..."
exec /opt/focalboard/bin/focalboard-server --config /opt/focalboard/config.json
