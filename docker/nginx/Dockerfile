FROM nginx:1.17.8-alpine

RUN mkdir /gateway
WORKDIR /gateway

## Remove default nginx configs
RUN rm /etc/nginx/conf.d/default.conf

## Copy custom configs from local to the nginx container
COPY docker/nginx/nginx.conf /etc/nginx/conf.d

## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

EXPOSE 80
EXPOSE 443
