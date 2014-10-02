# create cronjob for exim panic log check and tinydb
CRON='25 6 * * * /opt/core/bin/exim-cron.sh'
(crontab -l 2>/dev/null || true; echo "$CRON" ) | sort | uniq | crontab

# enable exim service
/usr/sbin/svcadm enable svc:/pkgsrc/exim:default
