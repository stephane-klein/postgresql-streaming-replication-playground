#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../../"

docker-compose exec postgres2 sh -c "psql -x -U \$POSTGRES_USER \$POSTGRES_DB -c 'select * from pg_stat_wal_receiver'"