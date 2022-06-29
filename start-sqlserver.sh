#!/bin/bash

set -eu

MSSQLSERVER_VERSION=2019
CONTAINER_NAME=mssqlserver-$MSSQLSERVER_VERSION

if [[ -z "$(docker container ls -a | grep -e "$CONTAINER_NAME$")" ]]; then
    docker create\
        -e "ACCEPT_EULA=Y"\
        -e "SA_PASSWORD=P@ssw0rd"\
        --name $CONTAINER_NAME\
        -p 1433:1433\
        mcr.microsoft.com/mssql/server:${MSSQLSERVER_VERSION}-latest
fi

echo "Starting SQL server in tmux session: $CONTAINER_NAME"
tmux new-session -d -s $CONTAINER_NAME docker start --attach $CONTAINER_NAME

