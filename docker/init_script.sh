#!/usr/bin/env bash

# start cron
/usr/bin/crontab /etc/crontab.txt
/usr/sbin/crond -l 8

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf