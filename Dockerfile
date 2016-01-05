FROM haproxy:latest

MAINTAINER Mathieu Buffenoir <lalu@riseup.net>

RUN apt-get update && apt-get install -y curl unzip --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN curl -k -L -o /tmp/consul-template.zip https://releases.hashicorp.com/consul-template/0.12.0/consul-template_0.12.0_linux_amd64.zip && \
  cd /tmp && \
  unzip consul-template.zip && \
  cp consul-template /usr/local/bin/consul-template && \
  chmod a+x /usr/local/bin/consul-template

# 2 files need to be mounted in /tmp/haproxy.json and the haproxy.ctmpl templatefile

ENTRYPOINT ["consul-template", "-config=/tmp/consule-template.conf"]
CMD ["-consul=consul.service.consul:8500"]
