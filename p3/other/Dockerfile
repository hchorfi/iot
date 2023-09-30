FROM openresty/openresty

RUN apt-get update
RUN apt-get install curl vim -y

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/openresty/nginx.conf
COPY ./info.lua /etc/openresty/info.lua

EXPOSE 80