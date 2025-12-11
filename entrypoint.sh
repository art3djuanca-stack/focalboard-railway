#!/bin/sh

if [ -n "$DATABASE_URL" ]; then
  sed -i "s|POSTGRES_URL|$DATABASE_URL|g" /app/config.json
fi

echo "Starting Focalboard server..."
exec /opt/focalboard/bin/focalboard-server --config /app/config.json
