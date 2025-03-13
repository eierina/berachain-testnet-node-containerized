#!/bin/bash
set -e

# Initialize environment
source /app/env.sh

# Create directories
mkdir -p ${BEACOND_DATA} ${BEACOND_CONFIG} ${LOG_DIR} /app/shared

# Fetch network parameters
/app/fetch-berachain-params.sh

# Setup beacon chain node
/app/setup-beacond.sh

# Ensure JWT is in shared location
cp ${JWT_PATH} /app/shared/jwt.hex

# Start beacond
exec /app/run-beacond.sh