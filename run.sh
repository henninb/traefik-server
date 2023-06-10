#!/bin/sh

if [ $# -ne 1 ]; then
  echo "Usage: $0 <platform>"
  echo "docker or podman"
  exit 1
fi

platform=$1

if [ "$platform" = "podman" ]; then
  podman stop traefik-server
  podman rm -f traefik-server
  echo "running server on port 443"

  echo 0 | sudo tee /proc/sys/net/ipv4/ip_unprivileged_port_start
  podman-compose build
  podman-compose up
elif [ "$platform" = "docker" ]; then
  docker stop traefik-server
  echo docker rm -f traefik-server
  docker rm -f traefik-server
  # echo "running server on port 443"

  blocking=$(docker ps -a --filter "expose=443"  --format '{{.ID}}')
  if [ -n "${blocking}" ]; then
    echo stop
    docker stop "${blocking}"
    docker rm -f "${blocking}"
  fi

  echo docker exec -it --user root traefik-server /bin/bash
  echo docker exec -it --user root traefik-server ss --listen
  echo docker logs traefik-server

  # docker run -d -p 8084:80 -p 8083:8080 \
  # -v /var/run/docker.sock:/var/run/docker.sock \
  # -v $PWD/traefik.yml:/traefik.yml \
  # --name traefik \
  # traefik:v2.5

  if command -v docker-compose; then
    docker compose build
    docker compose up -d
  else
    docker build -t traefik-server .
    docker run --name=traefik-server -h traefik-server -h traefik-server --restart unless-stopped -p 443:443 -d traefik-server
  fi
fi

exit 0
