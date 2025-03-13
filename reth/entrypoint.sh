#!/bin/bash
set -e

# Wait for JWT file
while [ ! -f /app/shared/jwt.hex ]; do
  echo "Waiting for JWT file..."
  sleep 5
done

# Initialize environment
source ./env.sh

# Setup execution client
./setup-reth.sh

# Start reth
exec ./run-reth.sh