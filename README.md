Docker Images from sdk .Net
========================
[![Docker Repository on Quay](https://quay.io/repository/yosvield/sdk/status "Docker Repository on Quay")](https://quay.io/repository/yosvield/sdk)

```
FROM mcr.microsoft.com/dotnet/sdk:8.0
MAINTAINER Yosviel Dominguez Gonzalez <yosvield@gmail.com>

ENV http_proxy=http://10.128.50.3:2568 \
    https_proxy=http://10.128.50.3:2568 \
    ftp_proxy=http://10.128.50.3:2568 \
    no_proxy=localhost,127.0.0.1,.uci.cu,10.0.0.0/8
```

## Using the Published Docker Image

The Docker image is published to Docker Hub and can be pulled and run using the following commands:

```
docker pull <your-docker-username>/sdk:latest
docker run -it <your-docker-username>/sdk:latest
```

Replace `<your-docker-username>` with your actual Docker Hub username.

You can also use the image in your `Dockerfile`:

```
FROM <your-docker-username>/sdk:latest
```
