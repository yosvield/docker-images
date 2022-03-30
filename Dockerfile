FROM nginx:stable-alpine
LABEL maintainer="Yosviel Dominguez <yosvield@gmail.com>"

ENV PS1="\u@\h:\w\\$ "
ENV PHP_HOST="php"

COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/

CMD sed -i.bak s/PHP_HOST/$PHP_HOST/g /etc/nginx/conf.d/default.conf

RUN apk add --no-cache bash