FROM nginx:stable-alpine
LABEL maintainer="Yosviel Dominguez <yosvield@gmail.com>"

ENV PS1="\u@\h:\w\\$ "
ENV SERVER_NAME localhost
ENV SERVER_ROOT /app/web
ENV PHP_HOST php
ENV PHP_PORT 9000


ADD start.sh /usr/local/bin/

COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/

RUN apk add --no-cache bash

RUN ["chmod", "+x", "/usr/local/bin/start.sh"]

CMD ["/usr/local/bin/start.sh"]