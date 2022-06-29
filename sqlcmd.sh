#!/bin/bash

set -eu

docker exec -it mssqlserver-2019 /opt/mssql-tools/bin/sqlcmd "$@"
