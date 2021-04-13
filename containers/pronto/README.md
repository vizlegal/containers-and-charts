# Pronto contianer image

A single image with: ruby, pronto and some runners

## Usage

    podman run --rm -v $PWD:/app quay.io/vizlegalq/pronto:0.11.0 pronto run /app

    podman run --rm -v $PWD:/app quay.io/vizlegalq/pronto:0.11.0 pronto run /app

    podman run --rm quay.io/vizlegalq/pronto:0.11.0 pronto list
