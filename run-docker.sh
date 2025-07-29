#!/bin/sh

echo set -gx DOCKER_HOST tcp://192.168.10.10:2375
echo export DOCKER_HOST=tcp://192.168.10.10:2375
echo export DOCKER_HOST=ssh://henninb@192.168.10.10

# doas cp /etc/letsencrypt/live/finance.bhenning.com/privkey.pem proxy.key
# doas cp /etc/letsencrypt/live/finance.bhenning.com/fullchain.pem proxy.crt
# doas chown henninb:henninb *.pem *.crt *.key

docker context create remote --docker "host=ssh://henninb@192.168.10.10"
# echo docker context use remote
# docker context ls

export DOCKER_HOST=ssh://henninb@192.168.10.10

docker build -t traefik-server .

docker images
docker rm -f traefik-server

docker run --name=traefik-server -h traefik-server --restart unless-stopped -p 443:443 -d traefik-server

docker ps -a

exit 0

# docker save traefik-server | docker --context remote load

# echo export DOCKER_HOST=ssh://henninb@192.168.10.10
# export DOCKER_HOST=tcp://192.168.10.10:2375
# export DOCKER_HOST=ssh://henninb@192.168.10.10

docker commit traefik-server traefik-server
docker save traefik-server | docker --context remote load
export DOCKER_HOST=ssh://henninb@192.168.10.10
docker rm -f traefik-server
docker run --name=traefik-server -h traefik-server --restart unless-stopped \
  -p 80:80 -p 443:443 \
  -v ./traefik.toml:/etc/traefik/traefik.toml \
  -v ./dynamic:/etc/traefik/dynamic \
  -d traefik-server
docker ps -a

exit 0
