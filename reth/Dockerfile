# reth/Dockerfile
FROM --platform=linux/arm64 ghcr.io/paradigmxyz/reth:v1.1.5

RUN apt-get update && apt-get install -y \
    curl jq \
    && rm -rf /var/lib/apt/lists/*

# COPY setup-reth.sh \
#      run-reth.sh \
#      env.sh \
#      entrypoint.sh \
#      ./
COPY . /app/

WORKDIR /app

RUN chmod +x /app/*.sh

VOLUME ["/app/var", "/app/shared"]

ENTRYPOINT ["/app/entrypoint.sh"]