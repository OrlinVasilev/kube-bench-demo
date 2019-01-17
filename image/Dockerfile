FROM centos:7

#only for example purposes
RUN yum update -y
RUN yum install -y gettext wget curl procps vim
RUN curl -L -o /tmp/docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-18.06.1-ce.tgz \
    && tar -xz -C /tmp -f /tmp/docker.tgz \
    && mv /tmp/docker/docker /usr/bin \
    && rm -rf /tmp/docker.tgz /tmp/docker

COPY docker.sh /
ENTRYPOINT ["/docker.sh"]
