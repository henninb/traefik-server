FROM traefik:v1.7.34-alpine
COPY ./proxy.crt /etc/ssl/certs/
COPY ./proxy.key /etc/ssl/certs/proxy.crt.key
#COPY ./haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
