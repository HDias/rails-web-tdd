#!/bin/bash
set -e

echo 'Starting webpack dev server ...' && ./bin/webpack-dev-server &
# Remove a potentially pre-existing server.pid for Rails.
rm -f /rails_tdd/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"