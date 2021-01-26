FROM elixir:1.11

ENV \
  PHX_VER=1.5.7 \
  NODE_VER=14.x \
  APP=/app HOME=/app \
  PKGS="inotify-tools postgresql-client git"

RUN groupadd -g 1000 appuser \
  && useradd -r -u 1000 -g appuser appuser \
  && mkdir -p $APP \
  && chown appuser:appuser $APP

RUN \
  curl -sL https://deb.nodesource.com/setup_$NODE_VER | bash - \
  && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -qq $PKGS \
  && apt-get install -qq nodejs yarn \
  && apt-get clean \
  && rm -r /var/lib/apt/lists /var/cache/apt/archives

USER appuser
WORKDIR $APP

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

RUN \
  mix local.hex --force \
  && mix local.rebar --force \
  && mix archive.install hex phx_new $PHX_VER --force

EXPOSE 4000
CMD ["iex"]
