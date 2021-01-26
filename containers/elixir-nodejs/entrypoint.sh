#!/bin/bash
set -e

if [[ "$VERBOSE" = "true" ]]; then
  set -x
fi

# Use local dir deps
if [[ "$LOCAL_DEV" = "true" ]]; then
  export MIX_HOME=/app/.mix
fi

if [ "$1" = 'test' ] || [ "$1" = 'tests' ]; then
  exec env MIX_ENV=test mix test --color --stale
fi

if [ "$1" = 'server' ]; then
  exec mix phx.server
fi

if [ "$1" = 'phx' ]; then
  exec iex -S mix phx.server
fi

if [ "$1" = 'iex' ]; then
  exec iex
fi

exec "$@"
