FROM nginx:stable-alpine
LABEL maintainer="Yosviel Dominguez <yosvield@gmail.com>"

ENV PS1="\u@\h:\w\\$ "

RUN apk add --no-cache bash