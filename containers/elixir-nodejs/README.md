# Elixir + nodeJS image

## Build

    podman build -t quay.io/vizlegalq/elixir-nodejs:1.17.3-slim .

    podman build -t quay.io/vizlegalq/elixir-nodejs:1.17.3 . --build-arg variant=""

    podman build -t quay.io/vizlegalq/elixir-nodejs:1.17.3 . --build-arg variant=""

## Build MultiArch with Docker

    docker buildx build --push --platform linux/arm64,linux/amd64 --build-arg node_ver=20.x --tag quay.io/vizlegalq/elixir-nodejs:1.17-node20-otp-27-slim .


## Build MultiArch with Podman

https://developers.redhat.com/articles/2023/11/03/how-build-multi-architecture-container-images


    podman manifest create quay.io/vizlegalq/elixir-nodejs:1.17-node20-otp-27-slim
    podman build --platform linux/amd64,linux/arm64  --manifest quay.io/vizlegalq/elixir-nodejs:1.17-node20-otp-27-slim  .
    podman manifest push quay.io/vizlegalq/elixir-nodejs:1.17-node20-otp-27-slim


## check image
    docker run --rm quay.io/vizlegalq/elixir-nodejs:1.17-node20-otp-27-slim bash -c \
    'echo "Elixir version: $(elixir -v )" && echo "Node.js version: $(node -v)" && echo "CPU architecture: $(cat /proc/version)"  '