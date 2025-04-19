#!/usr/bin/bash
#
# This is the "entrypoint" script to setup and run asterisk w/o systemd
# and all the  nicities you need

modprobe dahdi
modprobe dahdi_transcode
modprobe dahdi_dummy

/usr/sbin/asterisk -f

