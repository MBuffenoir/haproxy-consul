FROM haproxy:latest

MAINTAINER Mathieu Buffenoir <lalu@riseup.net>

RUN curl -L -o /tmp/consul-template https://releases.hashicorp.com/consul-template/0.12.0/consul-template_0.12.0_linux_amd64.zip && \
  cd /tmp && \
  tar -xf consul-template && \
  cp consul-template_0.7.0_linux_amd64/consul-template /usr/local/bin/consul-template && \
  chmod a+x /usr/local/bin/consul-template


