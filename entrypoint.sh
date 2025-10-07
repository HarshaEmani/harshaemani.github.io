#!/bin/sh
# Exit immediately if a command exits with a non-zero status.
set -e

# --- Your Custom Commands Go Here ---
echo "Node version:"
node -v
echo "NPM version:"
npm -v

echo "Running npm install..."
npm install
# ------------------------------------

# Execute the command passed into the container
# This will run the 'hugo --gc --minify ...' command from your docker-compose file
echo "Executing original command: $@"
exec "$@"