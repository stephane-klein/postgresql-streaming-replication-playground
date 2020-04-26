# PostgreSQL 12 streaming replication playground

PostgreSQL 12 [streaming replication](https://www.postgresql.org/docs/12/warm-standby.html#STREAMING-REPLICATION) playground, based on this documentation: [PostgreSQL : la streaming replication en 12](https://blog.capdata.fr/index.php/postgresql-la-streaming-replication-en-12/)

```
$ ./scripts/generate-self-signed-certificate.sh
$ docker-compose up -d postgres1
$ ./scripts/wait-service.sh postgres1 5432
```

```
$ ./scripts/pg1/load-configuration.sh
$ ./scripts/pg1/load-seed.sh
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

Steaming replication limitations:

- It cannot perform selective replication or part of the database cannot be replicated.
- It cannot replicate between two different major versions.
- It cannot perform any writes in the standby server.
- It cannot replicate between different platforms (for example, Linux and Windows)

to go ahead this limitations, you can use PostgreSQL 12 logical replication.