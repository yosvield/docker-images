FROM alpine:3.15
LABEL maintainer="Yosviel Dominguez <ydominguezg@uci.cu>"

ENV PHP_FPM_HOST php7-fpm
ENV PHP_FPM_PORT  9002
ENV SERVER_NAME  localhost

ADD nginx.conf /etc/nginx/
ADD symfony.conf /etc/nginx/conf.d/

RUN apk add --update nginx
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*

RUN adduser -D -g '' -G www-data www-data

CMD sed -i.bak s/PHP_FPM_HOST/$PHP_FPM_HOST/g /etc/nginx/conf.d/symfony.conf && sed -i.bak s/PHP_FPM_PORT/$PHP_FPM_PORT/g /etc/nginx/conf.d/symfony.conf && sed -i.bak s/SERVER_NAME/$SERVER_NAME/g /etc/nginx/conf.d/symfony.conf && nginx

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
