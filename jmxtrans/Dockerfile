FROM ubuntu:16.04
MAINTAINER Alexander Ivchenko

RUN apt-get -y update && \
  apt-get install -y wget unzip default-jdk curl && \
  rm -rf /var/lib/apt/lists/*

RUN wget http://central.maven.org/maven2/org/jmxtrans/jmxtrans/270/jmxtrans-270-dist.tar.gz && \
    tar xvzf jmxtrans-270-dist.tar.gz
RUN wget https://releases.hashicorp.com/consul-template/0.20.0/consul-template_0.20.0_linux_amd64.zip && \
    unzip consul-template_0.20.0_linux_amd64.zip && \
    chmod +x consul-template && \
    cp /consul-template /bin/consul-template
COPY jmxtrans.yaml.tpl /etc/jmxtrans.yaml.tpl
COPY restart.sh /restart.sh
COPY set-env.sh.tpl /etc/set-env.sh.tpl
RUN chmod +x restart.sh

ENV JMX_HOST $JMX_HOST
ENV JMX_PORT $JMX_PORT
ENV CONSUL_HOST $CONSUL_HOST
ENV CONSUL_PORT $CONSUL_PORT
ENV MONITOR_OPTS "-Dcom.sun.management.jmxremote.local.only=false -Djava.rmi.server.hostname=${JMX_HOST}"

ENTRYPOINT consul-template -consul-addr "${CONSUL_HOST}:${CONSUL_PORT}" -template "/etc/set-env.sh.tpl:/set-env.sh" -template "/etc/jmxtrans.yaml.tpl:/jmxtrans-270/conf/jmxtrans.yaml:/restart.sh"
