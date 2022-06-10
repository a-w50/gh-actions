FROM debian:11.3-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip
RUN apt-get install -y git
RUN python3 -m pip install git+https://github.com/EVerest/everest-dev-environment#subdirectory=dependency_manager
RUN mkdir -p /.cache/cpm
ENV CPM_SOURCE_CACHE /.cache/cpm
RUN edm --register-cmake-module
RUN apt-get install -y clang-format
RUN apt-get install -y curl

RUN curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
