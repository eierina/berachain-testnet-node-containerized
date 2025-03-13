#!/bin/bash
set -e

# Initialize environment
source /app/env.sh

# Create directories (safe to run repeatedly)
mkdir -p ${BEACOND_DATA} ${BEACOND_CONFIG} ${LOG_DIR} /app/shared

# Only fetch params if they don't exist
if [ ! -f "$SEED_DATA_DIR/genesis.json" ]; then
  echo "Fetching network parameters..."
  /app/fetch-berachain-params.sh
fi

# Only run setup if validator key doesn't exist
if [ ! -f "$BEACOND_CONFIG/priv_validator_key.json" ]; then
  echo "Initializing beacon client..."
  /app/setup-beacond.sh
else
  echo "✓ Beacon client already initialized"
fi

# Ensure JWT exists in shared location (idempotent)
if [ ! -f "/app/shared/jwt.hex" ] && [ -f "$JWT_PATH" ]; then
  echo "Copying JWT secret..."
  cp "$JWT_PATH" /app/shared/jwt.hex
fi

# Start beacond
exec /app/run-beacond.sh