ARG BASE_IMAGE="rockylinux"
ARG BASE_TAG="9"

FROM ${BASE_IMAGE}:${BASE_TAG}

ARG PACKAGES=" \ 
    bash-completion \
    bind-utils \
    curl \
    git \
    iputils \
    jq \
    mysql \
    net-tools \
    openldap-clients \
    postgresql \
    redis \
    sqlite \
    tcpdump \
    unzip \
    vim \
    wget \
    wireshark-cli \
  "

RUN dnf -y update \
    && dnf -y install epel-release yum-utils \
    && yum-config-manager --enable epel \
    && dnf install -y --setopt=install_weak_deps=False --allowerasing $PACKAGES \
    && dnf clean all \
    && rm -rf /var/cache/dnf

ENTRYPOINT ["tail", "-f", "/dev/null"]
