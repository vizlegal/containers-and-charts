FROM ruby:2.7

LABEL vendor="vizlegal"

ENV \
  LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8 \
  PKGS="git build-essential automake cmake curl apt-transport-https ca-certificates make openssl libssl1.1 gnupg" \
  GEMS="pronto rubocop rubocop-performance rubocop-rails fasterer brakeman reek pronto-rubocop pronto-fasterer pronto-brakeman pronto-reek"

RUN \
  apt-get update -qq \
  && apt-get install -qqy $PKGS \
  && apt-get clean \
  && rm -r /var/lib/apt/lists /var/cache/apt/archives \
  && gem install $GEMS --no-document --silent
