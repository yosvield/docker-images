FROM mcr.microsoft.com/dotnet/sdk:8.0
LABEL maintainer="Yosviel Dominguez Gonzalez <yosvield@gmail.com>"

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    libfontconfig1 \
    libfreetype6 \
    libharfbuzz0b \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get install -y --no-install-recommends libpng16-16
RUN apt-get install -y --no-install-recommends libwebp6
RUN apt-get install -y --no-install-recommends libx11-6
RUN apt-get install -y --no-install-recommends libxext6
RUN apt-get install -y --no-install-recommends libxrender1

ENV http_proxy=http://10.128.50.3:2568 \
    https_proxy=http://10.128.50.3:2568 \
    ftp_proxy=http://10.128.50.3:2568 \
    no_proxy=localhost,127.0.0.1,.uci.cu,10.0.0.0/8
