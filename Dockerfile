FROM alpine:3.6

LABEL maintainer="esplo <esplo@users.noreply.github.com>"

ENV NGINX_VERSION 1.13.5

VOLUME /etc/nginx/ssl

RUN apk add --no-cache openssl nginx gettext \
    && mkdir -p /run/nginx/

COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY entrypoint.sh .

EXPOSE 443
STOPSIGNAL SIGTERM

ENTRYPOINT sh entrypoint.sh
