#!/bin/bash

echo "Starting Berachain testnet (bepolia) containers..."
echo "RPC will be available at http://localhost:9656 when synced"

docker-compose up -d

echo ""
echo "To view logs:"
echo "docker-compose logs -f"
echo ""
echo "To stop the node:"
echo "docker-compose down"