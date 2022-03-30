Docker Images NGINX SYMFONY
========================
[![Docker Repository on Quay](https://quay.io/repository/yosvield/nginx-symfony/status "Docker Repository on Quay")](https://quay.io/repository/yosvield/nginx-symfony)

Image of nginx for symfony 3.*
###Pull
`docker pull docker.prod.uci.cu/quay.io/yosvield/nginx-symfony:1.3.4`

###Usage in Docker composer 
```
version: "2"

services:
    ...
    api:
        image: docker.prod.uci.cu/quay.io/yosvield/nginx-symfony:1.3.4
        ports:
            - 82:80
        depends_on:
            - php
```

###Enviroment
`PHP_HOST`: Service of php-fpm. Default `php`

###Custom usage
```
version: "2"

services:
    ...
    api:
        image: docker.prod.uci.cu/quay.io/yosvield/nginx-symfony:1.3.4
        ports:
            - 82:80
        volumes:
            - /paht/to/symfony.conf:/etc/nginx/conf.d/default.conf:ro
            - /paht/to/nginx.conf:/etc/nginx/nginx.conf:ro
        environment:
           PHP_HOST: "php_fpm"    
        depends_on:
            - php_fpm
```

###Example
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
    image: docker.prod.uci.cu/quay.io/yosvield/nginx-symfony:1.3.4
    restart: always
    ports:
      - 82:80
    depends_on:
      - php
```