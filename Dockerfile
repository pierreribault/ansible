FROM ubuntu:18.04
LABEL maintainer="Pierre Ribault <contact@pierreribault.fr>"
LABEL description="Ansible image for continuous integration"

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends \
        software-properties-common \
    && apt-add-repository -y ppa:ansible/ansible \
    && apt-get -y update \
    && apt-get install -y --no-install-recommends \
        ansible \
        openssh-client \
        rsync \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["ansible", "--version"]
