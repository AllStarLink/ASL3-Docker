#!/usr/bin/bash
#
# This is the "entrypoint" script to setup and run asterisk w/o systemd
# and all the  nicities you need

modprobe dahdi
modprobe dahdi_transcode
modprobe dahdi_dummy

# Prepare missing configuration (if needed)
chown asterisk:asterisk /etc/asterisk
if [ ! -f /etc/asterisk/asterisk.conf ]; then
	apt install --reinstall -o Dpkg::Options::="--force-confmiss" asl3-asterisk-config
fi

# Fix defaults that don't work in a container
perl -pi -e 's/node_lookup_method\s+=\s+both/node_lookup_method = dns/g' \
	/etc/asterisk/rpt.conf
perl -pi -e 's/^rxchannel\s+=\s+SimpleUSB\/1999/rxchannel = dahdi\/pseudo/g' \
	/etc/asterisk/rpt.conf

/usr/sbin/asterisk -f

