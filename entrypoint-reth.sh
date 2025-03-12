#!/bin/bash

set -e

# Source environment variables
. /app/env.sh

# Set testnet-specific variables
export CHAIN_SPEC=testnet
export MONIKER_NAME=my-testnet-node
export WALLET_ADDRESS_FEE_RECIPIENT=0x9BcaA41DC32627776b1A4D714Eef627E640b3EF5
export EL_ARCHIVE_NODE=false

# Fetch network parameters if seed data is missing
if [ ! -d "$SEED_DATA_DIR" ]; then
    /app/fetch-berachain-params.sh
fi

# Run setup if database is missing
if [ ! -d "$RETH_DATA/db" ]; then
    /app/setup-reth.sh
fi

# Start the execution client
/app/run-reth.sh