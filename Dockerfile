FROM debian:buster
LABEL maintainer="Caio Tedim, caiotedim@gmail.com"
LABEL version="0.0.4"
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
  vim \
  whois \
  ruby \
  ruby-dev \
  rubygems \
  ca-certificates \
  apt-transport-https && update-ca-certificates && gem install --no-document fpm && \
  apt-get clean --dry-run
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install && \
  rm -rf aws*
RUN curl -s -v -O https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz && \
  tar -xf go1.14.4.linux-amd64.tar.gz -C /usr/local/ && \
  rm -rf go1.14.4*.tar.gz && \
  mkdir -p /golang/{src,pkg,bin}
ENV GOROOT="/usr/local/go"
ENV GOPATH="/golang"
RUN curl -JLO 'https://pm.puppet.com/cgi-bin/pdk_download.cgi?dist=debian&rel=10&arch=amd64&ver=latest' && \
  dpkg -i pdk_*.deb && rm -rf pdk_*.deb
RUN echo "    StrictHostsFile no" >> /etc/ssh/ssh_config && \
  echo "    UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config
RUN KUBECTL_VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) \
  curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  mv kubectl /usr/local/bin/kubectl
