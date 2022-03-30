Docker Images NGINX SYMFONY
========================
[![Docker Repository on Quay](https://quay.io/repository/yosvield/nginx-symfony/status "Docker Repository on Quay")](https://quay.io/repository/yosvield/nginx-symfony)

Image of nginx for symfony 3.*
### Pull
`docker pull docker.prod.uci.cu/quay.io/yosvield/nginx-symfony:1.3.5`

### Usage in Docker composer 
```
version: "2"

services:
    ...
    api:
        image: docker.prod.uci.cu/quay.io/yosvield/nginx-symfony:1.3.5
        ports:
            - 82:80
        depends_on:
            - php
```

### Enviroment
`SERVER_NAME`: Server name. Default `localhost`
`SERVER_ROOT`: Root public of app. Default `/app/web`
`PHP_HOST`: Service of php-fpm. Default `php`
`PHP_PORT`: Port of service of php-fpm. Default `9000`

### Custom usage
```
version: "2"

services:
    ...
    api:
        image: docker.prod.uci.cu/quay.io/yosvield/nginx-symfony:1.3.5
        ports:
            - 82:80
        volumes:
            - /paht/to/symfony.conf:/etc/nginx/conf.d/default.conf:ro
            - /paht/to/nginx.conf:/etc/nginx/nginx.conf:ro
        environment:
           SERVER_NAME: "example.com"    
           SERVER_ROOT: "/app/public"    
           PHP_HOST: "php_fpm"    
           PHP_PORT: "9001"    
        depends_on:
            - php_fpm
```

### Example
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
    image: docker.prod.uci.cu/quay.io/yosvield/nginx-symfony:1.3.5
    restart: always
    ports:
      - 82:80
    depends_on:
      - php
```