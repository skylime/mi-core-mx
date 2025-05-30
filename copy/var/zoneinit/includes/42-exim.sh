## Exim special configuration

umask 027

EXIMLOCAL=/opt/local/etc/exim/configure.local
echo "## File generated by mdata-setup script" > $EXIMLOCAL

# Hostname
echo "PRIMARY_HOSTNAME = $(/usr/sbin/mdata-get sdc:hostname)" >> $EXIMLOCAL

# Administrativ Emailaddress
ADMIN_CONTACT='root'

if ADMIN_CONTACT=$(/usr/sbin/mdata-get rfc2142_mail 2> /dev/null) \
  || ADMIN_CONTACT=$(/usr/sbin/mdata-get mail_adminaddr 2> /dev/null); then
  echo "ADMIN_CONTACT = ${ADMIN_CONTACT:='root'}" >> $EXIMLOCAL
fi

# Default DKIM
mdata-get dkim_private_key > /opt/local/etc/exim/domain.key
echo "DEFAULT_DOMAINKEY = /opt/local/etc/exim/domain.key" >> $EXIMLOCAL

# Secrets for SRS-Hash
# Define old an new to be able to change secrets
echo "SRS_SECRET = $(mdata-get srs_secret)" >> $EXIMLOCAL
echo "SRS_OLD_SECRET = $(mdata-get srs_secret_old)" >> $EXIMLOCAL

if mdata-get dkim_selector 1> /dev/null 2>&1; then
  echo "DKIM_SELECTOR = $(mdata-get dkim_selector)" >> $EXIMLOCAL
else
  echo "DKIM_SELECTOR = dkim" >> $EXIMLOCAL
fi

# Allow to overwrite the default mailbox delivery for non core.io
# mailbox servers for example.
if mdata-get mbox_smtp_addr 1> /dev/null 2>&1; then
  # Overwrite the LMTP connection which should be default
  echo "MAILBOX_SERVER   == $(mdata-get mbox_smtp_addr)" >> $EXIMLOCAL
  echo "MAILBOX_SRV_PORT == 25" >> $EXIMLOCAL
  echo "MAILBOX_TRANSPORT== int_smtp" >> $EXIMLOCAL
fi

if mdata-get mbox_lmtp_addr 1> /dev/null 2>&1 && mdata-get mbox_lmtp_key 1> /dev/null 2>&1; then
  # Secure the lmtp connection via spiped
  /opt/core/bin/spiped-configure-smf mbox-lmtp encrypt [127.0.0.1]:24 $(mdata-get mbox_lmtp_addr):2424 $(mdata-get mbox_lmtp_key)
  # Provide trusted TLS connection and verification in exim
  echo "TLS_VERIFY_CERT_HOSTNAMES == $(mdata-get mbox_lmtp_addr)" >> $EXIMLOCAL
fi

# create cronjob for exim panic log check and tinydb
CRON='25 6 * * * /opt/core/bin/exim-cron.sh'
(
  crontab -l 2> /dev/null || true
  echo "$CRON"
) | sort | uniq | crontab

# enable exim service
/usr/sbin/svcadm enable svc:/pkgsrc/exim:default
