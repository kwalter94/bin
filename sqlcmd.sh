#!/bin/bash

set -eu

echo $@

docker exec -it mssqlserver-2019 /opt/mssql-tools/bin/sqlcmd "$@"
