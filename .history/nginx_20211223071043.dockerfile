FROM debian:jessie

LABEL maintainer linux_shuai@163.com

ENV NGINX_VERSION 1.10.1-1~jessie

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
    && echo "deb http://nginx.org/packages/debian/   jessie nginx"  >>  /etc/apt/sources.list\
    && apt-get update \
    && apt-get install --no-install-recommends  --no-install-suggests -y \
    ca-certificates\
    nginx=$(NGINX_VERSION) \
    nginx-module-xslt \
    nginx-module-geoip \
    nginx-module-image-filter \
    nginx-module-perl \
    nginx-module-njs \
    gettext-base \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout  /var/log/nginx/access.log \
    && ln -sf /dev/stderr  /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx","-g","daemon off;"]