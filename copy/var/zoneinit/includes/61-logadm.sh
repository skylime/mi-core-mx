# Extra logadm rules for all required mail services

logadm -w '/var/log/exim/main'        -A 7d -p 1d -c -N -o mail -g mail -m 640
logadm -w '/var/log/exim/reject'      -A 7d -p 1d -c -N -o mail -g mail -m 640
logadm -w '/var/log/redis/redis.log'  -A 7d -p 1d -c -N -o redis -g redis -m 640
logadm -w '/var/log/clamav/clamd.log' -A 7d -p 1d -c -N -o clamav -g clamav -m 640
