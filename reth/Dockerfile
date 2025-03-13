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
COPY . .

RUN chmod +x /entrypoint.sh *.sh

VOLUME ["/app/var", "/app/shared"]
WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]