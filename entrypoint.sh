#!/bin/sh

# Replace placeholder with Railway DATABASE_URL
if [ -n "$DATABASE_URL" ]; then
  sed -i "s|POSTGRES_URL|$DATABASE_URL|g" /opt/focalboard/config.json
fi

echo "Starting Focalboard server..."
exec /opt/focalboard/bin/focalboard-server
