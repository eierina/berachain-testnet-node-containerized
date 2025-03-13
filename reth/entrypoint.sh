#!/bin/bash
set -e

# Wait for JWT file
while [ ! -f /app/shared/jwt.hex ]; do
  echo "Waiting for JWT file..."
  sleep 5
done

# Initialize environment
source /app/env.sh

while [ ! -f "${SEED_DATA_DIR}/eth-genesis.json" ]; do
  echo "Waiting for genesis file..."
  sleep 5
done

# Setup execution client
/app/setup-reth.sh

# Start reth
exec /app/run-reth.sh