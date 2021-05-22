#!/bin/bash
UUID=$(mdata-get sdc:uuid)
DDS=zones/${UUID}/data

if zfs list ${DDS} 1>/dev/null 2>&1; then
	zfs create ${DDS}/rspamd || true
	if ! zfs get -o value -H mountpoint ${DDS}/rspamd | grep -q /var/db/redis/rspamd; then
		zfs set mountpoint=/var/db/redis/rspamd ${DDS}/rspamd
	fi
fi
