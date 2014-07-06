#!/bin/bash
# Configure nginx ssl certificate

# SSL
mdata-get nginx_ssl > /opt/local/etc/nginx/ssl/nginx.pem
chmod 400 /opt/local/etc/nginx/ssl/nginx.pem
