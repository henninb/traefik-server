FROM traefik:v3.5.0
# FROM traefik:v2.5.3
COPY ./brianhenning.fullchain.pem /app/brianhenning.fullchain.pem
COPY ./brianhenning.privkey.pem /app/brianhenning.privkey.pem
COPY ./bhenning.fullchain.pem /app/bhenning.fullchain.pem
COPY ./bhenning.privkey.pem /app/bhenning.privkey.pem
#COPY ./traefik.yml /etc/traefik/traefik.yml
COPY ./traefik.toml /etc/traefik/traefik.toml
COPY ./dynamic /app/dynamic
RUN apk update
RUN apk add -q --no-cache ca-certificates
RUN update-ca-certificates
