# FROM traefik:v1.7.34-alpine
FROM traefik:v2.10.1
COPY ./proxy.crt /etc/ssl/certs/proxy.crt
COPY ./proxy.key /etc/ssl/private/proxy.key
#COPY ./traefik.yml /etc/traefik/traefik.yml
