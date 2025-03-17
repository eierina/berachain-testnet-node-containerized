Built for Linux/amd64 only.

## Cleanup
docker compose down -v 

sudo git clean -fxd

## Full clean rebuild
docker compose --env-file .env up -d --build --force-recreate && docker compose logs -f
