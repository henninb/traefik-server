FROM traefik:v3.5.0
# FROM traefik:v2.5.3
COPY ./brianhenning.fullchain.pem /etc/ssl/certs/
COPY ./brianhenning.privkey.pem /etc/ssl/private/
COPY ./bhenning.fullchain.pem /etc/ssl/certs/
COPY ./bhenning.privkey.pem /etc/ssl/private/
#COPY ./traefik.yml /etc/traefik/traefik.yml
RUN apk update
RUN apk add -q --no-cache ca-certificates
RUN update-ca-certificates
