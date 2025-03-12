#!/bin/bash

set -e

# Source environment variables
. /app/env.sh

# Set testnet-specific variables
export CHAIN_SPEC=testnet
export MONIKER_NAME=my-testnet-node
export WALLET_ADDRESS_FEE_RECIPIENT=0x9BcaA41DC32627776b1A4D714Eef627E640b3EF5
export EL_ARCHIVE_NODE=false
export EL_HOST=reth  # For Docker networking

# Fetch network parameters if seed data is missing
if [ ! -d "$SEED_DATA_DIR" ]; then
    /app/fetch-berachain-params.sh
fi

# Run setup if validator key is missing
if [ ! -f "$BEACOND_CONFIG/priv_validator_key.json" ]; then
    /app/setup-beacond.sh
    # Adjust rpc-dial-url for Docker networking
    sed -i 's|^rpc-dial-url = ".*"|rpc-dial-url = "http://reth:'"$EL_AUTHRPC_PORT"'"|' "$BEACOND_CONFIG/app.toml"
fi

# Start the consensus client
/app/run-beacond.sh