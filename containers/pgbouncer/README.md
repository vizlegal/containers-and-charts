# PGBouncer

Yet another container with pgbouncer

- alpine linux
- pgbouncer from alpine package manager

Based on https://github.com/edoburu/docker-pgbouncer

## Version

`PGB_VERSION` is pinned and comes from the alpine base image, so the two move
together (see the table in the `Dockerfile`). The build asserts the installed
version matches `PGB_VERSION` and fails if it does not — bumping one without the
other is a build error, not a surprise at runtime.

## Build

The cluster runs amd64, so pass `--platform` when building on an arm64 Mac:

    podman build --platform linux/amd64 -t quay.io/vizlegalq/pgbouncer:1.25.2 .

Push the version tag only — no `latest`. A mutable tag on shared infra is how you
end up unable to tell what is actually running.

    podman push quay.io/vizlegalq/pgbouncer:1.25.2

## RUN

    podman run --rm -e DATABASE_URL="postgres://USER:PW@pg.default.svc.cluster.local/DB" -p 5432:5432 quay.io/vizlegalq/pgbouncer:1.25.2

    podman run --rm -e DATABASE_URL="postgres://USER:PW@pg.default.svc.cluster.local/DB" -p 5432:5432 -v pgbouncer.ini:/etc/pgbouncer/pgbouncer.ini:ro quay.io/vizlegalq/pgbouncer:1.25.2

`entrypoint.sh` only generates a config from the env vars when
`/etc/pgbouncer/pgbouncer.ini` does not exist. Mount your own ini (second form
above, and what the chart does) and every `PGB_*`/`POOL_MODE`/etc. env var is
ignored.
