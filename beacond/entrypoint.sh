# beacond/entrypoint.sh
#!/bin/bash
set -e

# Initialize environment
source ./env.sh

# Create directories
mkdir -p ${BEACOND_DATA} ${BEACOND_CONFIG} ${LOG_DIR} /app/shared

# Fetch network parameters
./fetch-berachain-params.sh

# Setup beacon chain node
./setup-beacond.sh

# Ensure JWT is in shared location
cp ${JWT_PATH} /app/shared/jwt.hex

# Start beacond
exec ./run-beacond.sh