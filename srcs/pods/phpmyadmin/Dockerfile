FROM phpmyadmin/phpmyadmin:fpm-alpine

RUN apk update && \
	apk add nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY script /script

ENTRYPOINT sh /script
