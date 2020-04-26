# PostgreSQL 12 streaming replication playground

PostgreSQL 12 [streaming replication](https://www.postgresql.org/docs/12/warm-standby.html#STREAMING-REPLICATION) playground, based on this documentation: [PostgreSQL : la streaming replication en 12](https://blog.capdata.fr/index.php/postgresql-la-streaming-replication-en-12/)

```
$ ./scripts/generate-self-signed-certificate.sh
$ docker-compose up -d postgres1
$ ./scripts/wait-service.sh postgres1 5432
```

```
$ ./scripts/pg1/load-configuration.sh
$ ./scripts/pg1/load-seed
$ ./scripts/pg1/insert-fixtures.sh
```

```
$ ./scripts/pg2/prepare.sh
```

```
$ docker-compose up -d postgres2
```

```
$ ./scripts/pg2/query.sh
count
-------
    10
$ ./scripts/pg1/insert-fixtures.sh
$ ./scripts/pg2/query.sh
count
-------
    20
```