FROM alpine:latest

LABEL adapted_from="https://github.com/felicianotech/docker-hugo"
LABEL maintainer="bob@bobng.com"

ENV HUGO_VERSION=0.49.2
ENV HUGO_DOWNLOAD_URL=https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN apk add --no-cache \
  bash \
  build-base \
  ca-certificates \
  curl \
  git \
  libcurl \
  # Needed for Hugo Extended which uses CGO
  libc6-compat \
  libxml2-dev \
  libxslt-dev \
  openssh \
  rsync \
  wget

RUN wget "$HUGO_DOWNLOAD_URL" && \
  tar xzf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  mv hugo /usr/bin/hugo && \
  rm hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz LICENSE README.md

RUN mkdir /app
WORKDIR /app
ENTRYPOINT [ "hugo" ]