# Elixir + nodeJS image

## Build

    podman build -t quay.io/vizlegalq/elixir-nodejs:1.12.3-slim .

    podman build -t quay.io/vizlegalq/elixir-nodejs:1.12.3 . --build-arg variant=""

    podman build -t quay.io/vizlegalq/elixir-nodejs:1.12.3 . --build-arg variant="" --build-arg node_ver=18.x
