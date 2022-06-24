FROM ubuntu:focal
LABEL vendor="vizlegal"

# Install node16 and Playwright
RUN apt-get update && apt-get install -y curl && \
  curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
  apt-get install -y nodejs

ENV APP=/play

RUN mkdir -p $APP

WORKDIR $APP

COPY play/package.json play/package-lock.json play/vrt.mjs ./

RUN npm ci --no-optional
RUN npx playwright install --with-deps
RUN npx playwright install-deps
