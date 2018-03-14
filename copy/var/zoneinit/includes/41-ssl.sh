# This script will try to manage the ssl certificates for us, we support
# own ssl certificates, let's encrypt and selfsigned fallbacks for dev
# usage

# Request and manage SSL certificates
/opt/core/bin/ssl-generator.sh /opt/local/etc/exim/ssl mx_ssl exim svc:/pkgsrc/exim:default

# Fix permissions
chgrp mail /opt/local/etc/exim/ssl/exim.*
