#!/bin/bash

# Core configuration
export CHAIN_SPEC=testnet
export MONIKER_NAME=camembera
export WALLET_ADDRESS_FEE_RECIPIENT=0x9BcaA41DC32627776b1A4D714Eef627E640b3EF5
export EL_ARCHIVE_NODE=false
export MY_IP=$(curl -s ipv4.canhazip.com)

# Path configuration
export LOG_DIR=/app/logs
export BEACOND_BIN=/app/bin/beacond
export RETH_BIN=/usr/local/bin/reth

# Data directories
export BEACOND_DATA=/app/var/beacond
export BEACOND_CONFIG=$BEACOND_DATA/config
export RETH_DATA=/app/var/reth
export SEED_DATA_DIR=/app/seed-data-80069

# Network ports
export CL_ETHRPC_PORT=26657
export CL_ETHP2P_PORT=26656
export EL_ETHRPC_PORT=8545
export EL_AUTHRPC_PORT=8551
export PROMETHEUS_PORT=9101

# Chain parameters
export CHAIN_ID=80069
export JWT_PATH=$BEACOND_DATA/config/jwt.hex
export SED_OPT='-i'