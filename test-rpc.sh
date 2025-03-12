#!/bin/bash

echo "Testing Berachain RPC connection on port 9656..."

curl --location 'http://localhost:9656' \
--header 'Content-Type: application/json' \
--data '{
  "jsonrpc": "2.0",
  "method": "eth_blockNumber",
  "params": [],
  "id": 420
}'

echo -e "\n\nTesting chain ID..."

curl --location 'http://localhost:9656' \
--header 'Content-Type: application/json' \
--data '{
  "jsonrpc": "2.0",
  "method": "eth_chainId",
  "params": [],
  "id": 420
}'

echo -e "\n"