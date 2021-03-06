#!/usr/bin/env bash

# ensure MYSQL_ROOT_PASSWORD
# and MYSQL_DATABASE are set
if [[ -z $MYSQL_ROOT_PASSWORD ]]
then
    echo "please set MYSQL_ROOT_PASSWORD"
    exit 1
fi
if [[ -z $MYSQL_DATABASE ]]
then
    echo "please set MYSQL_DATABASE"
    exit 1
fi

CONTAINER_NAME=blueitdb

# stop and remove any existing container instance
if [ "$(docker ps -aq --filter name=$CONTAINER_NAME)" ]
then
    docker rm -f $CONTAINER_NAME
fi

# run the container
docker run -d \
--name $CONTAINER_NAME \
-p 127.0.0.1:3306:3306 \
-e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
-e MYSQL_DATABASE=$MYSQL_DATABASE \
drstearns/blueitdb
