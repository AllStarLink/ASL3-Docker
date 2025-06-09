# ASL3-Docker
This is the Docker to run ASL3's asterisk as a Docker container. Note this is a very *basic*
framework for running Asterisk as a container. While it's designed primarily for running ASL3
it will, in fact, works a normal Asterisk system as well.

Full instructions at https://community.allstarlink.org/t/docker-for-asterisk-app-rpt/23365/2

## Configuration
The configuration of ASterisk is located in the `asterisk_conf` directory.Upon first composition
of the container, the `asterisk_conf` directory will be populated by  the needed
configurations. This directory is used within the container as the `/etc/asterisk` directory.

## Building
Construct the docker container with:

```bash
docker compose up -d --build --force-recreate
```
The `asl3-init.sh` is used during the composition process to build the system. Alterations
for composing should be added here when possible instead of the `Dockerfile` or 
`docker-compose.yml`. Do not delete the `fake-systemctl` - that is needed to simulate
systemd configurations for successful package installation.

## Ports
Additional ports for SIP/RTP can be added in `docker-compose.yml` with the following:

```yml
    ports:
      - "5060:5060/udp"       # SIP signaling
      - "10000-20000:10000-20000/udp"  # RTP media streams
```
and then proper configuration of `sip.conf` and `rtp.conf`.
