FROM alpine:3.20

ENV PGB_VERSION=1.21.0

RUN apk add --update openssl "pgbouncer>${PGB_VERSION}" \
  && rm /etc/pgbouncer/pgbouncer.ini \
  && addgroup -g 70 -S postgres 2>/dev/null \
  && adduser -u 70 -S -D -H -h /var/lib/postgresql -g "Postgres user" -s /bin/sh -G postgres postgres 2>/dev/null \
  && chown -R postgres /etc/pgbouncer

ADD entrypoint.sh /entrypoint.sh
USER postgres
EXPOSE 5432
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]
