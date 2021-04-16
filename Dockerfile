# Download base image
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="jconstam@gmail.com"
LABEL version="0.2"

WORKDIR /buildroot
VOLUME ["/buildroot"]

# Install most of the build tools
RUN apt-get update && \
    apt-get install -y \
        git \
        build-essential \
        wget \
        cpio \
        unzip \
        rsync \
        bc \
        libncurses5-dev \
        screen \
        file \
        python3