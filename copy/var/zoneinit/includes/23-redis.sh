#!/usr/bin/env bash
# Configure redis for replication and rspamd services

svcadm enable svc:/core/redis:api-repl
svcadm enable svc:/core/redis:rspamd


