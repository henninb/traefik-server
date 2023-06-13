FROM traefik:v2.10.1
# FROM traefik:v2.5.3
COPY ./proxy.crt /etc/ssl/certs/proxy.crt
COPY ./proxy.key /etc/ssl/private/proxy.key
#COPY ./traefik.yml /etc/traefik/traefik.yml
RUN mkdir -p /usr/local/share/ca-certificates
COPY ./rootCA.pem /usr/local/share/ca-certificates/rootCA.pem
RUN apk update
RUN apk add -q --no-cache ca-certificates
RUN update-ca-certificates
