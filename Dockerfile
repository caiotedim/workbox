FROM debian:buster
MAINTAINER Caio Tedim, caiotedim@gmail.com
RUN apt update && apt upgrade -y && \
  apt install -y \
  curl \
  git \
  tmux \
  tar \
  gzip \
  bzip2 \
  unzip \
  ssh \
  automake \
  build-essential \
  python3 \
  python3-dev \
  python3-pip \
  jq \
  nginx \
  screen \
  tcpdump \
  net-tools \
  telnet \
  ca-certificates \
  apt-transport-https && update-ca-certificates
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install
RUN curl -s -v -O https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz && tar -xf go1.14.4.linux-amd64.tar.gz -C /usr/local/
RUN curl -JLO 'https://pm.puppet.com/cgi-bin/pdk_download.cgi?dist=debian&rel=10&arch=amd64&ver=latest' && \
  dpkg -i pdk_*.deb

