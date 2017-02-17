# This script will try to manage the ssl certificates for us, we support
# own ssl certificates, let's encrypt and selfsigned fallbacks for dev
# usage

# Default
SSL_HOME='/opt/local/etc/exim/ssl/'

# Create folder if it doesn't exists
mkdir -p "${SSL_HOME}"

# Use user certificate if provided
if mdata-get mx_ssl 1>/dev/null 2>&1; then
	(
	umask 0077
	mdata-get mx_ssl > "${SSL_HOME}/exim.pem"
	# Split files for exim usage
	openssl pkey -in "${SSL_HOME}/exim.pem" -out "${SSL_HOME}/exim.key"
	openssl crl2pkcs7 -nocrl -certfile "${SSL_HOME}/exim.pem" | \
		openssl pkcs7 -print_certs -out "${SSL_HOME}/exim.crt"
	chgrp mail ${SSL_HOME}/exim.*
	)
else
	# Try to generate let's encrypt ssl certificate for the hostname
	if /opt/core/bin/ssl-letsencrypt.sh 1>/dev/null; then
		LE_HOME='/opt/local/etc/letsencrypt/'
		LE_LIVE="${LE_HOME}live/$(hostname)/"
		# Workaround to copy correct files for SSL_HOME
		(
		umask 0077
		cat ${LE_LIVE}/fullchain.pem > ${SSL_HOME}/exim.crt
		cat ${LE_LIVE}/privkey.pem   > ${SSL_HOME}/exim.key
		chgrp mail ${SSL_HOME}/exim.*
		)
		# Update renew-hook.sh
		echo '#!/usr/bin/env bash' > ${LE_HOME}renew-hook.sh
		echo "cat ${LE_LIVE}/fullchain.pem > ${SSL_HOME}/exim.crt" >> ${LE_HOME}renew-hook.sh
		echo "cat ${LE_LIVE}/privkey.pem   > ${SSL_HOME}/exim.key" >> ${LE_HOME}renew-hook.sh
	else
		# Fallback to selfsigned ssl certificates
		/opt/core/bin/ssl-selfsigned.sh -d ${SSL_HOME} -f exim
	fi
fi
