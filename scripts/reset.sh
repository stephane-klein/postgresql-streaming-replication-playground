#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

docker-compose down
rm -rf volumes

docker-compose up -d postgres1
./scripts/wait-service.sh postgres1 5432
./scripts/pg1/load-configuration.sh
./scripts/pg1/load-seed.sh
./scripts/pg1/insert-fixtures.sh
