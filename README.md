# Dockerized Berachain Testnet Node

This setup creates a containerized Berachain testnet (bepolia) node with:
- beacond consensus client 
- reth execution client
- Port mapping: 8545 → 9656 for RPC access
- Multi-architecture support (AMD64 and ARM64)

## Prerequisites

- Docker and Docker Compose installed
- At least 48GB RAM and 4TB storage (SSD) as per hardware requirements

## Quick Start

1. Clone this repository
2. Run the containers:

```bash
# For production ARM64 target machine
docker-compose up -d

# OR for testing on MacBook Pro M4
./test-on-mac.sh
```

3. Check the logs:

```bash
docker-compose logs -f
```

## Using the Node

Once synced, you can access the Berachain RPC at:
```
http://localhost:9656
```

## Testing the RPC

```bash
curl --location 'http://localhost:9656' \
--header 'Content-Type: application/json' \
--data '{
  "jsonrpc": "2.0",
  "method": "eth_blockNumber",
  "params": [],
  "id": 420
}'
```

## Data Persistence

All data is stored in Docker volumes:
- berachain_data: Chain data
- berachain_logs: Log files
- berachain_seed: Genesis and network parameters

## Configuration

The setup uses the following parameters:
- CHAIN_SPEC=testnet (bepolia)
- MONIKER_NAME=camembera
- Non-archive node
- reth v1.1.5 with optimized parameters:
  - --engine.persistence-threshold=0
  - --engine.memory-block-buffer-target=0