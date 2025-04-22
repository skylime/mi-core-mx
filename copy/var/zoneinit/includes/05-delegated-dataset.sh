#!/usr/bin/env bash

if DDS=$(/opt/core/bin/dds); then
  zfs create "${DDS}/rspamd" || true
  if ! zfs get -o value -H mountpoint "${DDS}/rspamd" | grep -q /var/db/redis/rspamd; then
    zfs set mountpoint=/var/db/redis/rspamd "${DDS}/rspamd"
  fi

  zfs create "${DDS}/exim" || true
  if ! zfs get -o value -H mountpoint "${DDS}/exim" | grep -q /var/spool/exim; then
    zfs set mountpoint=/var/spool/exim "${DDS}/exim"
  fi
fi
