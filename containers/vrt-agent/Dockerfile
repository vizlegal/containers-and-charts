FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=America/Los_Angeles
ARG DOCKER_IMAGE_NAME_TEMPLATE="quay.io/vizlegalq/vrt-agent:1.0.0"

# === INSTALL Node.js ===

RUN apt-get update && \
  # Install node16
  apt-get install -y curl wget && \
  curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
  apt-get install -y nodejs
# Feature-parity with node.js base images.
RUN apt-get install -y --no-install-recommends git openssh-client && \
  # clean apt cache
  rm -rf /var/lib/apt/lists/*
# Create the pwuser
# adduser pwuser

ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

RUN mkdir -p $PLAYWRIGHT_BROWSERS_PATH

WORKDIR $PLAYWRIGHT_BROWSERS_PATH

COPY play/package.json ./

RUN npm -g install --check-files

RUN npx playwright mark-docker-image "${DOCKER_IMAGE_NAME_TEMPLATE}"

RUN npx playwright install --with-deps && \
  rm -rf /var/lib/apt/lists/* && \
  chmod -R 777 /${PLAYWRIGHT_BROWSERS_PATH}