#!/usr/bin/env bash
# Configure redis for replication and rspamd services

chmod o+x /var/db/redis
chmod 775 /var/log/redis

chown mail /var/db/redis/api-repl
chown rspamd /var/db/redis/rspamd

svcadm enable svc:/core/redis:api-repl
svcadm enable svc:/core/redis:rspamd
