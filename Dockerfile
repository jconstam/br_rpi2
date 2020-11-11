# Download base image Alpine Linux 3.11
FROM alpine:3.11

# LABEL about the custom image
LABEL maintainer="jconstam@google.com"
LABEL version="0.1"

# Install most of the build tools
RUN apk add --no-cache \
    build-base \
    libc-dev \
    bsd-compat-headers \
    bash \
    binutils \
    linux-headers \
    make \
    gcc \
    g++ \
    patch \
    gzip \
    bzip2 \
    perl \
    cpio \
    unzip \
    rsync \
    file \
    bc \
    wget \
    git \
    ncurses \
    ncurses-dev \
    texinfo

WORKDIR /buildroot
VOLUME ["/buildroot"]