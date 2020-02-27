FROM nginx:alpine
MAINTAINER Jacens

RUN apk add --update openssh

COPY script /script

ENTRYPOINT sh /script

EXPOSE 443 80 22
