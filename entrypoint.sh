#!/bin/sh

set -eu

openssl req -new -x509 -sha256 -newkey rsa:2048 -days 365 -nodes -out /etc/nginx/ssl/nginx.pem -keyout /etc/nginx/ssl/nginx.key -subj "/C=JP/ST=MyState/L=MyLocality/O=MyOrg/OU=dev/CN=localhost"

envsubst '$$PORT$$HOST_IP' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
cat /etc/nginx/nginx.conf
nginx

