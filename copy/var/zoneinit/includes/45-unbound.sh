#!/usr/bin/env bash
# To use local resolver it's required to modify the /etc/resolv.conf. This is
# not possible via (this) script. Use metadata variable `resolvers` if
# possible.

# Enable unbound service
svcadm enable svc:/pkgsrc/unbound:default
