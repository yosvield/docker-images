Docker Images PHP7 FPM SYMFONY
========================
[![Docker Repository on Quay](https://quay.io/repository/yosvield/php-fpm/status "Docker Repository on Quay")](https://quay.io/repository/yosvield/php-fpm)

Image of php for symfony 4.* , 5.* , 6.*
### Pull
`docker pull docker.prod.uci.cu/quay.io/yosvield/php-fpm`

### Example usage in Docker composer 

```
version: "2"

services:
  php:
    image: docker.prod.uci.cu/quay.io/yosvield/php-fpm:latest
    restart: always
    volumes:
      - /path/to/app:/app
    environment:
      APP_ENV: "test"
      APP_DEBUG: "false"
      
  api:
    image: docker.prod.uci.cu/quay.io/yosvield/nginx-symfony:1.0.0
    restart: always
    ports:
      - 82:80
    depends_on:
      - php
```
