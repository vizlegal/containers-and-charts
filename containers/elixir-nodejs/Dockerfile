ARG elixir_ver="1.20.5"
ARG otp_ver="29.1.3"
ARG debian="trixie-20261123"
ARG variant="-slim"

FROM hexpm/elixir:${elixir_ver}-erlang-${otp_ver}-debian-${debian}${variant}

ARG port=4000
ARG mix_env=dev
ARG node_ver=26.x

LABEL vendor="vizlegal"

ENV \
  MIX_ENV="${mix_env}" \
  LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8 \
  NODE_VER="${node_ver}" \
  APP=/app HOME=/app \
  PKGS="inotify-tools postgresql-client git build-essential automake cmake apt-transport-https ca-certificates locales make openssl gnupg"

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

# +JMsingle: lets the amd64 JIT run under QEMU when building multi-arch on an arm64 Mac.
# Scoped to this step; the published image keeps the default JIT settings.
RUN ERL_FLAGS="+JMsingle true" mix do local.hex --force + local.rebar --force
