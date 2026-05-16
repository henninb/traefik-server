# Traefik Server

A Dockerized Traefik reverse proxy configured for TLS termination and dynamic routing. Serves as the edge router for services running on the local network or VPS.

## Prerequisites

- Docker and Docker Compose
- SSL certificates (or generate via `cert-install.sh`)

## Setup

Generate/install SSL certificates:

```bash
./cert-install.sh
```

## Running

```bash
./run.sh
```

Or with Docker:

```bash
./run-docker.sh
```

Or directly with Docker Compose:

```bash
docker-compose up -d
```

## Configuration

| File | Description |
|------|-------------|
| `traefik.toml` | Static Traefik configuration (entrypoints, providers, TLS) |
| `dynamic/` | Dynamic routing configuration (routers, services, middlewares) |
| `Dockerfile` | Traefik Docker image |
| `docker-compose.yml` | Service and network definitions |

## Files

- `bhenning.fullchain.pem` / `bhenning.privkey.pem` — TLS certificate/key for `bhenning.com`
- `brianhenning.fullchain.pem` / `brianhenning.privkey.pem` — TLS certificate/key for `brianhenning.com`
