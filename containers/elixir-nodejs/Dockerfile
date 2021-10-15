FROM elixir:1.12.3

LABEL vendor="vizlegal"

ENV \
  LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8 \
  NODE_VER=16.x \
  APP=/app HOME=/app \
  PKGS="inotify-tools postgresql-client git build-essential automake cmake inotify-tools curl apt-transport-https ca-certificates locales make openssl libssl1.1 gnupg"

RUN \
  groupadd -g 1000 appuser \
  && useradd --create-home -r -u 1000 -g appuser appuser \
  && mkdir -p $APP \
  && chown appuser:appuser $APP

RUN \
  curl -sL https://deb.nodesource.com/setup_$NODE_VER | bash - \
  && apt-get update -qq \
  && apt-get install -qq $PKGS nodejs \
  && apt-get clean \
  && locale-gen C.UTF-8 \
  && update-locale LANG=C.UTF-8 \
  && rm -r /var/lib/apt/lists /var/cache/apt/archives

# USER appuser
WORKDIR $APP

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

RUN mix do local.hex --force, local.rebar --force

EXPOSE 4000
# CMD ["iex"]
