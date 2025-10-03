ARG variant="-slim"

FROM elixir:1.18$variant

ARG port=4000
ARG mix_env=dev
ARG node_ver=22.x

LABEL vendor="vizlegal"

ENV \
  MIX_ENV="${mix_env}" \
  LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8 \
  NODE_VER="${node_ver}" \
  APP=/app HOME=/app \
  PKGS="inotify-tools postgresql-client git build-essential automake cmake inotify-tools apt-transport-https ca-certificates locales make openssl gnupg"

EXPOSE $port

RUN \
  groupadd -g 1000 appuser \
  && useradd --create-home -r -u 1000 -g appuser appuser \
  && mkdir -p $APP \
  && chown appuser:appuser $APP

RUN \
  apt-get update -qq \
  && apt-get install -qq curl \
  && curl -fsSL https://deb.nodesource.com/setup_$NODE_VER | bash - \
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
