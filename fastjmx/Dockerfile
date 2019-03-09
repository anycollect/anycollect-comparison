FROM ubuntu:16.04
ARG COLLECTD_VERSION=5.8.0
RUN apt-get -y update && \
  apt-get install -y wget bzip2 gcc make unzip maven openjdk-8-jdk curl && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir collectd && \
  cd collectd && \
  wget https://storage.googleapis.com/collectd-tarballs/collectd-${COLLECTD_VERSION}.tar.bz2 && \
  tar xf collectd-${COLLECTD_VERSION}.tar.bz2 && \
  cd collectd-${COLLECTD_VERSION} && \
  ./configure --prefix /collectd/build/ && \
  make all install

RUN wget https://github.com/egineering-llc/collectd-fast-jmx/archive/1.0.0.zip && \
    unzip 1.0.0.zip && \
    cd collectd-fast-jmx-1.0.0 && \
    mvn clean install && \
    cp target/collectd-fast-jmx-1.0.0.jar /etc/collectd-fast-jmx.jar && \
    cp lib/collectd-api.jar /etc/collectd-api.jar

RUN wget https://releases.hashicorp.com/consul-template/0.20.0/consul-template_0.20.0_linux_amd64.zip && \
    unzip consul-template_0.20.0_linux_amd64.zip && \
    chmod +x consul-template && \
    cp /consul-template /bin/consul-template

COPY collectd.conf.tpl /etc/collectd.conf.tpl
COPY restart.sh /restart.sh
RUN chmod +x restart.sh

ENTRYPOINT consul-template -consul-addr "${CONSUL_HOST}:${CONSUL_PORT}" -template "/etc/collectd.conf.tpl:/collectd/build/etc/collectd.conf:/restart.sh"
