FROM alpine:3.17.2
LABEL maintainer="jbbodart@yahoo.com"

ENV REFRESH_INTERVAL=600
ENV SET_IPV4="yes"
ENV SET_IPV6="no"
ENV TTL=300

RUN apk -U upgrade \
 && apk add curl openssl bind-tools --no-cach \
 && rm -rf /var/cache/apk/* \
 && addgroup -S bil \
 && adduser -S -D bil -G bil

COPY run.sh update_ipv4.sh update_ipv6.sh /usr/local/bin/

WORKDIR /usr/local/bin/

RUN chmod +x run.sh update_ipv4.sh update_ipv6.sh

USER bil

CMD ["./run.sh"]
