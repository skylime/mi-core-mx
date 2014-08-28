# create cronjob for rblwatch/rblcheck
CRON='0 0,6,12,18 * * * /opt/local/bin/rblcheck'
(crontab -l 2>/dev/null || true; echo "$CRON" ) | sort | uniq | crontab
