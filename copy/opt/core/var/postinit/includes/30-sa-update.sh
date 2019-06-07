#!/usr/bin/env bash

sudo -u spamd /opt/local/bin/sa-update && \
	kill -SIGHUP $(cat /var/spamassassin/spamd.pid)
