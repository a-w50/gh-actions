FROM alpine:3.16.0

# all build dependencies
RUN apk update
RUN apk add git
RUN apk add py3-pip
RUN apk add curl
RUN apk add clang
RUN apk add clang-extra-tools

RUN apk add cmake
RUN apk add make
RUN apk add nodejs
RUN apk add nodejs-dev
RUN apk add npm
RUN apk add samurai
RUN apk add binutils
RUN apk add musl-dev
RUN apk add gcc
RUN apk add g++
RUN apk add boost1.78-log_setup
RUN apk add boost1.78-dev
RUN apk add sqlite-dev
RUN apk add openssl-dev
RUN apk add rsync

RUN apk add maven

RUN apk add ccache

# reviewdog
# RUN curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s

# edm and ev-cli
RUN python3 -m pip install git+https://github.com/EVerest/everest-dev-environment#subdirectory=dependency_manager
RUN python3 -m pip install git+https://github.com/EVerest/everest-utils#subdirectory=ev-dev-tools

# setup cache dirs
RUN mkdir -p /.cache/cpm
ENV CPM_SOURCE_CACHE /.cache/cpm
COPY maven-cache.xml /tmp/maven-cache.xml
RUN mkdir -p $HOME/.m2
RUN cp /tmp/maven-cache.xml $HOME/.m2/settings.xml
RUN mkdir -p /.cache/ccache
ENV CCACHE_DIR /.cache/ccache

# setup edm
RUN edm --register-cmake-module

RUN mkdir /workspace
WORKDIR /workspace
