# reth/Dockerfile
FROM ghcr.io/paradigmxyz/reth:v1.1.5

RUN apt-get update && apt-get install -y \
    curl jq \
    && rm -rf /var/lib/apt/lists/*

COPY reth/setup-reth.sh \
    reth/run-reth.sh \
    reth/env.sh \
    reth/entrypoint.sh \
    ./

RUN chmod +x /entrypoint.sh *.sh

VOLUME ["/app/var", "/app/shared"]
WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]