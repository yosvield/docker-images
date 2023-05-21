FROM node:16.17
MAINTAINER Yosviel Dominguez Gonzalez <yosvield@gmail.com>

RUN npm config set strict-ssl false
RUN npm config set proxy http://10.128.50.3:2568
RUN npm config set https-proxy http://10.128.50.3:2568
RUN npm config set no_proxy localhost,127.0.0.1,.uci.cu,10.0.0.0/8

ENV http_proxy=http://10.128.50.3:2568 \
    https_proxy=http://10.128.50.3:2568 \
    ftp_proxy=http://10.128.50.3:2568 \
    no_proxy=localhost,127.0.0.1,.uci.cu,10.0.0.0/8