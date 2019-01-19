FROM centos:7

#only for example purposes
RUN yum update -y \
    && yum install -y gettext wget curl procps vim \
    && yum clean all \
    && curl -L -o /tmp/docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-18.06.1-ce.tgz \
    && tar -xz -C /tmp -f /tmp/docker.tgz \
    && mv /tmp/docker/docker /usr/bin \
    && rm -rf /tmp/docker.tgz /tmp/docker \
    && curl -L -o /tmp/kubeaudit.tgz https://github.com/Shopify/kubeaudit/releases/download/v0.4.0/kubeaudit_0.4.0_linux_amd64.tar.gz \
    && tar -xz -C /tmp -f /tmp/kubeaudit.tgz \
    && mv /tmp/kubeaudit /usr/bin \
    && rm -rf /tmp/kubeaudit.tgz /tmp/kubeaudit

COPY docker.sh /

ENTRYPOINT ["/docker.sh"]
