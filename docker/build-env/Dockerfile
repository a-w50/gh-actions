FROM alpine:3.16.0

# all build dependencies
RUN apk update && \
    apk add \
        git \
        py3-pip \
        curl \
        clang \
        clang-extra-tools \
        cmake \
        make \
        nodejs \
        nodejs-dev \
        npm \
        samurai \
        binutils \
        musl-dev \
        gcc \
        g++ \
        boost1.78-log_setup \
        boost1.78-dev \
        sqlite-dev \
        openssl-dev \
        rsync \
        maven \
        ccache

# reviewdog
# RUN curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s

# edm and ev-cli
RUN python3 -m pip install git+https://github.com/EVerest/everest-dev-environment#subdirectory=dependency_manager && \
    python3 -m pip install git+https://github.com/EVerest/everest-utils#subdirectory=ev-dev-tools

# setup cache dirs
ENV CPM_SOURCE_CACHE /.cache/cpm
ENV CCACHE_DIR /.cache/ccache
COPY maven-cache.xml /tmp/maven-cache.xml
RUN mkdir -p /.cache/cpm && \
    mkdir -p $HOME/.m2 && \
    cp /tmp/maven-cache.xml $HOME/.m2/settings.xml && \
    mkdir -p /.cache/ccache

# setup edm
RUN edm --register-cmake-module

RUN mkdir /workspace
WORKDIR /workspace
