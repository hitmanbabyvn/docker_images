#!/bin/bash 

docker build . --build-arg PHP_VERSION=7.3 -t my-nginx:php7.3-v3
docker build . --build-arg PHP_VERSION=7.3 -t nginx-fpm:7.3-v3
docker build . --no-cache --build-arg PHP_VERSION=7.3 -t my-nginx:php7.3-v2
#docker build . --build-arg PHP_VERSION=5.6 -t my-nginx:php5.6-v-v11

# docker tag nginx-fpm:5.6-v3 hitmanbabyvn/nginx-fpm:5.6-v3
# docker tag nginx-fpm:7.3-v3 hitmanbabyvn/nginx-fpm:7.3-v3
# docker tag nginx-fpm:7.4-v3 hitmanbabyvn/nginx-fpm:7.4-v3
# docker push hitmanbabyvn/nginx-fpm:5.6-v3
# docker push hitmanbabyvn/nginx-fpm:7.3-v3
# docker push hitmanbabyvn/nginx-fpm:7.4-v3



## docker push hitmanbabyvn/nginx-fpm:7.3-v3
## docker push hitmanbabyvn/my-nginx:php7.3-v2


