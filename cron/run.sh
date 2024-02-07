#!/bin/bash

# Copy over the env variables created by docker in runtime into the crontab file
printenv > /tmp/crontab_env
for var in $(compgen -e); do
    echo "${var}=${!var}" >> /tmp/crontab_env
done

cat /etc/cron.d/crontab >> /tmp/crontab_env
mv /tmp/crontab_env /etc/cron.d/crontab

# Start cron service
crontab /etc/cron.d/crontab
cron -f
