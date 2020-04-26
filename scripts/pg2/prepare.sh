#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../../"

docker-compose run \
    -e PGPASSWORD=password \
    --rm \
    postgres2 bash -c "pg_basebackup -h postgres1 -U repli -D \$PGDATA -Fp -Xs -P -R"