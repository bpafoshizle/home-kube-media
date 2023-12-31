# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:arm64v8-3.17

# set version label
ARG BUILD_DATE
ARG VERSION
ARG READARR_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Roxedus,thespad"

# environment settings
ARG READARR_BRANCH="develop"
ENV XDG_CONFIG_HOME="/config/xdg"

RUN \
  echo "**** install packages ****" && \
  apk add -U --upgrade --no-cache \
    icu-libs \
    sqlite-libs && \
  echo "**** install readarr ****" && \
  mkdir -p /app/readarr/bin && \
  if [ -z ${READARR_RELEASE+x} ]; then \
    READARR_RELEASE=$(curl -sL "https://readarr.servarr.com/v1/update/${READARR_BRANCH}/changes?runtime=netcore&os=linuxmusl" \
    | jq -r '.[0].version'); \
  fi && \
  curl -o \
  /tmp/readarr.tar.gz -L \
    "https://readarr.servarr.com/v1/update/${READARR_BRANCH}/updatefile?version=${READARR_RELEASE}&os=linuxmusl&runtime=netcore&arch=arm64" && \
  tar xzf \
    /tmp/readarr.tar.gz -C \
    /app/readarr/bin --strip-components=1 && \
  echo -e "UpdateMethod=docker\nBranch=${READARR_BRANCH}\nPackageVersion=${VERSION}\nPackageAuthor=[linuxserver.io](https://www.linuxserver.io/)" > /app/readarr/package_info && \
  echo "**** cleanup ****" && \
  rm -rf \
    /app/readarr/bin/Readarr.Update \
    /tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8787

VOLUME /config