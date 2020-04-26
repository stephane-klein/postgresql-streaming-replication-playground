#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

mkdir -p certs/
openssl genrsa -out certs/server.key 2048
openssl req -new -key certs/server.key -out certs/server.csr -subj "/C=FR/ST=Lorraine/L=Metz/O=StephaneKlein/CN=postgres1,postgres2"
openssl x509 -req -days 365 -in certs/server.csr -signkey certs/server.key -out certs/server.crt

chmod go-r certs/*