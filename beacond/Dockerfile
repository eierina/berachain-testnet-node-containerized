# beacond/Dockerfile
FROM ubuntu:22.04 AS builder

RUN apt-get update && apt-get install -y \
    wget ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download ARM64 binary
RUN wget https://github.com/berachain/beacon-kit/releases/download/v1.1.3/beacond-v1.1.3-linux-arm64.tar.gz \
    && tar -xzf beacond-v1.1.3-linux-arm64.tar.gz \
    && mv beacond-v1.1.3-linux-arm64 /usr/local/bin/beacond \
    && chmod +x /usr/local/bin/beacond

FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl jq ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bin/beacond /usr/local/bin/beacond
COPY setup-beacond.sh fetch-berachain-params.sh run-beacond.sh env.sh ./
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh *.sh

VOLUME ["/app/var", "/app/shared"]
WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]