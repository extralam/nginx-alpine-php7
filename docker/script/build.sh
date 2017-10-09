#!/usr/bin/env bash

docker build -f ./docker/Dockerfile -t extralam/nginx-alpine-php7:$1 .
docker tag extralam/nginx-alpine-php7:$1 extralam/nginx-alpine-php7:latest
docker push extralam/nginx-alpine-php7:$1
docker push extralam/nginx-alpine-php7:latest
