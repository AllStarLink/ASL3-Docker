


##
## Architecture to compose - Supported options are 'amd64' and 'arm64'
ARG ARCH="amd64"

##
## Debian version to compose - Supported options are '12-slim' and '12'
ARG DEB_VER="12-slim"

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Without experience, do not change past this line
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FROM $ARCH/debian:$DEB_VER
WORKDIR /root

# setup fake systemd environment
COPY ./fake-systemctl /usr/bin/systemctl
RUN chmod +x /usr/bin/systemctl

# build the core
COPY ./asl3-init.sh /root/asl3-init.sh
RUN chmod +x /root/asl3-init.sh
RUN /root/asl3-init.sh

# Startup
ENTRYPOINT ["/usr/bin/bash","-c","/asl3/asl3.sh"]
