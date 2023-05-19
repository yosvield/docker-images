Docker Images from sdk .Net
========================
[![Docker Repository on Quay](https://quay.io/repository/yosvield/sdk/status "Docker Repository on Quay")](https://quay.io/repository/yosvield/sdk)

```
FROM mcr.microsoft.com/dotnet/sdk:6.0
MAINTAINER Yosviel Dominguez Gonzalez <yosvield@gmail.com>

ENV http_proxy=http://10.128.50.3:2568 \
    https_proxy=http://10.128.50.3:2568 \
    ftp_proxy=http://10.128.50.3:2568 \
    no_proxy=localhost,127.0.0.1,.uci.cu,10.0.0.0/8
```
