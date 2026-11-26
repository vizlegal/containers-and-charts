# Elixir + nodeJS image

Base: `hexpm/elixir` (pinned Elixir, OTP and Debian) + Node from NodeSource.
Versions are build args: `elixir_ver`, `otp_ver`, `debian`, `node_ver`, `variant` (`-slim` or `""`).

The vlui release ships the ERTS from this image, so vlui's runtime stage must use the
same Debian release (`trixie` builder → `minideb:trixie` runtime).

## Build

    podman build -t rg.fr-par.scw.cloud/vizlegal/elixir-nodejs:1.20-otp29-node26-trixie .

## Build MultiArch with Podman

https://developers.redhat.com/articles/2023/11/03/how-build-multi-architecture-container-images

    scw registry login program=podman   # or: podman login rg.fr-par.scw.cloud -u nologin (password = a Scaleway API secret key)
    podman manifest create rg.fr-par.scw.cloud/vizlegal/elixir-nodejs:1.20-otp29-node26-trixie
    podman build --platform linux/amd64,linux/arm64 --manifest rg.fr-par.scw.cloud/vizlegal/elixir-nodejs:1.20-otp29-node26-trixie .
    podman manifest push --all rg.fr-par.scw.cloud/vizlegal/elixir-nodejs:1.20-otp29-node26-trixie

CI runners and the k8s nodes are amd64, so the amd64 variant is required. On an arm64 Mac it is
built under QEMU, where OTP's amd64 JIT needs `+JMsingle true` (set in the Dockerfile for the
build step). To run the amd64 variant locally, pass it too:

    podman run --rm --platform linux/amd64 -e ERL_FLAGS="+JMsingle true" \
      rg.fr-par.scw.cloud/vizlegal/elixir-nodejs:1.20-otp29-node26-trixie bash -c 'uname -m && elixir -v'

## Build MultiArch with Docker

    docker buildx build --push --platform linux/arm64,linux/amd64 --tag rg.fr-par.scw.cloud/vizlegal/elixir-nodejs:1.20-otp29-node26-trixie .

The versions default to the ones in the Dockerfile. To pick up a newer OTP patch or Debian
security fixes, bump `otp_ver` / `debian` to a newer
[hexpm/elixir tag](https://hub.docker.com/r/hexpm/elixir/tags) and rebuild with `--pull`:

    docker buildx build --push --pull --platform linux/arm64,linux/amd64 \
      --build-arg otp_ver=29.1.3 --build-arg debian=trixie-20261123 \
      --tag rg.fr-par.scw.cloud/vizlegal/elixir-nodejs:1.20-otp29-node26-trixie .

## check image

    podman run --rm rg.fr-par.scw.cloud/vizlegal/elixir-nodejs:1.20-otp29-node26-trixie bash -c \
    'elixir -v && node -v && cat /etc/debian_version && uname -m'
