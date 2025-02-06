FROM mcr.microsoft.com/dotnet/sdk:8.0
LABEL maintainer="Yosviel Dominguez Gonzalez <yosvield@gmail.com>"

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    libfontconfig1 \
    libfreetype6 \
    libharfbuzz0b \
    libpng16-16 \
    libjpeg62-turbo \
    libwebp6 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    && rm -rf /var/lib/apt/lists/*

ENV http_proxy=http://10.128.50.3:2568 \
    https_proxy=http://10.128.50.3:2568 \
    ftp_proxy=http://10.128.50.3:2568 \
    no_proxy=localhost,127.0.0.1,.uci.cu,10.0.0.0/8
