FROM jayofdoom/docker-ubuntu-14.04

# The add is before the RUN to ensure we get the latest version of packages
# Docker will cache RUN commands, but because the SHA1 of the dir will be
# different it will not cache this layer
ADD . /tmp/teeth-agent

# Install requirements: Python for teeth-agent, others for putting an image on disk
RUN apt-get update && apt-get -y install \
    python python-pip python-dev \
    qemu-utils parted util-linux genisoimage git

RUN pip install /tmp/teeth-agent

ENTRYPOINT [ "/usr/local/bin/teeth-standby-agent" ]