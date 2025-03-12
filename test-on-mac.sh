#!/bin/bash

echo "Setting up Berachain testnet node for testing on MacBook..."

# Create platform-specific docker-compose file for testing
cat > docker-compose.mac.yml << 'EOF'
version: '3.8'

services:
  beacond:
    build:
      context: .
      dockerfile: Dockerfile.beacond
    container_name: beracond-container
    volumes:
      - berachain_data:/app/var
      - berachain_logs:/app/logs
      - berachain_seed:/app/seed-data-80069
    ports:
      - "26657:26657"
    environment:
      - MY_IP=beacond
    networks:
      - berachain-net
    restart: unless-stopped
    # Using native platform (no need for emulation on ARM Mac)
    
  reth:
    build:
      context: .
      dockerfile: Dockerfile.reth
    container_name: reth-container
    volumes:
      - berachain_data:/app/var
      - berachain_logs:/app/logs
      - berachain_seed:/app/seed-data-80069
    ports:
      - "9656:8545"  # Remapped port as requested
      - "8551:8551"
      - "30303:30303"
    depends_on:
      - beacond
    environment:
      - MY_IP=reth
    networks:
      - berachain-net
    restart: unless-stopped
    # Using native platform (no need for emulation on ARM Mac)

volumes:
  berachain_data:
  berachain_logs:
  berachain_seed:

networks:
  berachain-net:
    driver: bridge
EOF

echo "Starting Berachain testnet node containers for testing..."
echo "Note: This is for testing purposes only on MacBook. For production, use the regular docker-compose.yml"

docker-compose -f docker-compose.mac.yml up -d

echo ""
echo "To view logs:"
echo "docker-compose -f docker-compose.mac.yml logs -f"
echo ""
echo "To stop the test node:"
echo "docker-compose -f docker-compose.mac.yml down"