#!/bin/bash

set -eu

docker run -it mcr.microsoft.com/mssql/server:2019-latest /opt/mssql-tools/bin/sqlcmd "$@"
