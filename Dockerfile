FROM alpine:3.17.3
LABEL maintainer="jbbodart@yahoo.com"

ENV REFRESH_INTERVAL=600 \
    SET_IPV4="yes" \
    SET_IPV6="no" \
    TTL=300

WORKDIR /usr/local/bin/
COPY run.sh update_ipv4.sh update_ipv6.sh /usr/local/bin/

RUN apk -U upgrade \
    && apk add curl openssl bind-tools --no-cach \
    && rm -rf /var/cache/apk/* \
    && chmod +x run.sh update_ipv4.sh update_ipv6.sh \
    && addgroup -S bil \
    && adduser -S -D bil -G bil

#RUN chmod +x run.sh update_ipv4.sh update_ipv6.sh

USER bil

CMD ["./run.sh"]
