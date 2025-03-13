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

# Only initialize if genesis not already set up
if [ ! -f "$RETH_GENESIS_PATH" ]; then
  echo "Initializing execution client..."
  /app/setup-reth.sh
else
  echo "✓ Execution client already initialized"
  echo "  Genesis hash: $(jq -r '.hash' $RETH_GENESIS_PATH)"
fi

# Start reth
exec /app/run-reth.sh