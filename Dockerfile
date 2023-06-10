FROM traefik:v1.7.34-alpine
COPY ./proxy.crt /etc/ssl/certs/proxy.crt
COPY ./proxy.key /etc/ssl/private/proxy.key
COPY ./traefik.yml /etc/traefik/traefik.yml
