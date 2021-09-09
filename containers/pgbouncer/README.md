# PGBouncer

Yet another container with pgbouncer

- alpine linux
- pgbouncer from alpine package manager

Based on https://github.com/edoburu/docker-pgbouncer

## Build

    podman build -t quay.io/vizlegalq/pgbouncer:1.16.0 .

## RUN

    podman run --rm -e DATABASE_URL="postgres://USER:PW@pg.default.svc.cluster.local/DB" -p 5432:5432 quay.io/vizlegalq/pgbouncer:1.15.0

    podman run --rm -e DATABASE_URL="postgres://USER:PW@pg.default.svc.cluster.local/DB" -p 5432:5432 -v pgbouncer.ini:/etc/pgbouncer/pgbouncer.ini:ro quay.io/vizlegalq/pgbouncer:1.15.0
