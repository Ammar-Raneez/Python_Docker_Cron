#!/bin/bash

# Copy over the env variables created by docker in runtime into a temporary file
printenv > /tmp/crontab_env
for var in $(compgen -e); do
    echo "${var}=${!var}" >> /tmp/crontab_env
done

# Append the contents of the crontab file into the temporary file
cat /etc/cron.d/crontab >> /tmp/crontab_env

# Update the main crontab file with the contents of the temporary file (env vars and the crontab contents)
mv /tmp/crontab_env /etc/cron.d/crontab

# Start cron service
crontab /etc/cron.d/crontab
cron -f
