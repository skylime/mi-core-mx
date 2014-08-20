mi-core-mx
==========

Please refer to https://github.com/joyent/mibe for use of this repo.

## mdata variables

- <code>api_redis_addr</code>: ip or hostname of api server
- <code>api_redis_key</code>: base64 encoded spipe key for api server
- <code>mbox_lmtp_addr</code>: ip or hostname of lmtp server
- <code>mbox_lmtp_key</code>: base64 encoded spipe key for lmtp server
- <code>mx_ssl</code>: ssl cert, key and CA for smtp in pem format

- <code>dkim_private_key</code>: Default Domainkey for DKIM
- <code>srs_secret</code>: secret for generating SRS strings
- <code>srs_secret_old</code>: old/outdated secret for transition

## services

- <code>25/tcp</code>: smtp
- <code>465/tcp</code>: smtp encrypted
- <code>587/tcp</code>: smtp encrypted
