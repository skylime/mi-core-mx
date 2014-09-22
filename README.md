# mi-core-mx

This repository is based on [Joyent mibe](https://github.com/joyent/mibe). Please note this repository should be build with the [mi-core-base](https://github.com/skylime/mi-core-base) mibe image.

## description

SMTP MX / incoming server based on exim.

This image is part of the following images:

- [mi-core-mailapi](https://github.com/skylime/mi-core-mailapi)
- [mi-core-mx](https://github.com/skylime/mi-core-mx)
- [mi-core-submission](https://github.com/skylime/mi-core-submission)
- [mi-core-mbox](https://github.com/skylime/mi-core-mbox)
- [mi-core-webmail](://github.com/skylime/mi-core-webmail)

## mdata variables

- `api_redis_addr` [*]: ip or hostname of api server, ip addresses requires squared brackets
- `api_redis_key` [*]: base64 encoded spipe key for api server
- `mbox_lmtp_addr` [*]: ip or hostname of lmtp server, ip addresses requires squared brackets
- `mbox_lmtp_key` [*]: base64 encoded spipe key for lmtp server
- `mx_ssl` [*]: ssl cert, key and CA for smtp in pem format

- `dkim_selector`: DKIM selector (default is dkim)
- `dkim_private_key` [*]: Default Domainkey for DKIM
- `srs_secret` [*]: secret for generating SRS strings
- `srs_secret_old` [*]: old/outdated secret for transition

[*] is required to work properly.

## services

- `25/tcp`: smtp
- `465/tcp`: smtp encrypted
- `587/tcp`: smtp encrypted
