FROM alpine:3.24

# pgbouncer by alpine branch: 3.20 -> 1.22.1, 3.21 -> 1.23.1, 3.22 -> 1.24.0,
#                             3.23 -> 1.25.1, 3.24 -> 1.25.2
# Bumping PGB_VERSION therefore usually means bumping the base image too.
ARG PGB_VERSION=1.25.2
ENV PGB_VERSION=${PGB_VERSION}

RUN apk add --no-cache openssl "pgbouncer=~${PGB_VERSION}" \
  && pgbouncer --version 2>&1 | grep -qF "PgBouncer ${PGB_VERSION}" \
  && rm /etc/pgbouncer/pgbouncer.ini \
  && addgroup -g 70 -S postgres 2>/dev/null \
  && adduser -u 70 -S -D -H -h /var/lib/postgresql -g "Postgres user" -s /bin/sh -G postgres postgres 2>/dev/null \
  && chown -R postgres /etc/pgbouncer

LABEL org.opencontainers.image.title="pgbouncer" \
      org.opencontainers.image.version="${PGB_VERSION}" \
      org.opencontainers.image.base.name="docker.io/library/alpine:3.24" \
      org.opencontainers.image.source="https://github.com/vizlegal/containers-and-charts"

ADD entrypoint.sh /entrypoint.sh
USER postgres
EXPOSE 5432
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]
