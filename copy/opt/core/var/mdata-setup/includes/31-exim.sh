#!/bin/bash
# Configure exim with mdata information

# for SSL
mdata-get mx_ssl > /opt/local/etc/exim/ssl/exim.pem
chmod 400 /opt/local/etc/exim/ssl/exim.pem
chown mail /opt/local/etc/exim/ssl/exim.pem

## Exim special configuration
EXIMLOCAL=/opt/local/etc/exim/configure.local
echo "## File generated by mdata-setup script" > $EXIMLOCAL

# Hostname 
echo "PRIMARY_HOSTNAME = $(/usr/sbin/mdata-get sdc:hostname)" >> $EXIMLOCAL

# Administrativ Emailaddress
RFC2142_MAIL=$(/usr/sbin/mdata-get rfc2142_mail 2>/dev/null)
MAIL_ADMINADDR=$(/usr/sbin/mdata-get mail_adminaddr 2>/dev/null)
echo "ADMIN_CONTACT = ${RFC2142_MAIL:-${MAIL_ADMINADDR:='root'}}" >> $EXIMLOCAL

# Default DKIM
mdata-get dkim_private_key > /opt/local/etc/exim/domain.key
echo "DEFAULT_DOMAINKEY = /opt/local/etc/exim/domain.key" >> $EXIMLOCAL

# Secrets for SRS-Hash
# Define old an new to be able to change secrets
echo "SRS_SECRET = $(mdata-get srs_secret)" >> $EXIMLOCAL
echo "SRS_OLD_SECRET = $(mdata-get srs_secret_old)" >> $EXIMLOCAL

if mdata-get dkim_selector 1>/dev/null 2>&1; then
	echo "DKIM_SELECTOR = $(mdata-get dkim_selector)" >> $EXIMLOCAL
else
	echo "DKIM_SELECTOR = dkim" >> $EXIMLOCAL
fi

# Allow to overwrite the default mailbox delivery for non core.io
# mailbox servers for example.
if mdata-get mbox_smtp_addr 1>/dev/null 2>&1; then
	# Overwrite the LMTP connection which should be default
	echo "MAILBOX_SERVER   = $(mdata-get mbox_smtp_addr)" >> $EXIMLOCAL
	echo "MAILBOX_SRV_PORT = 25" >> $EXIMLOCAL
	echo "MAILBOX_TRANSPORT= int_smtp" >> $EXIMLOCAL
else if mdata-get mbox_lmtp_addr 1>/dev/null 2>&1 && mdata-get mbox_lmtp_key 1>/dev/null 2>&1; then
	# Secure the lmtp connection via spiped
	/opt/core/bin/spiped-configure-smf mbox-lmtp encrypt [127.0.0.1]:24 $(mdata-get mbox_lmtp_addr):2424 $(mdata-get mbox_lmtp_key)
fi
