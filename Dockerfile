FROM nginx:stable-alpine
LABEL maintainer="Yosviel Dominguez <yosvield@gmail.com>"

ENV PS1="\u@\h:\w\\$ "
ENV PHP_HOST php

ADD start.sh /usr/local/bin/

COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/

RUN apk add --no-cache bash

CMD ["/usr/local/bin/start.sh"]