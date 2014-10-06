# create cronjob for exim panic log check and tinydb
CRON='25 6 * * * /opt/core/bin/exim-cron.sh'
(crontab -l 2>/dev/null || true; echo "$CRON" ) | sort | uniq | crontab

# enable exim service
/usr/sbin/svcadm enable svc:/pkgsrc/exim:default

# configure logadm
logadm -w /var/log/exim/main -p 1d -C 10 -o mail -g mail -m 640 -c
logadm -w /var/log/exim/reject -p 1d -C 10 -o mail -g mail -m 640 -c
