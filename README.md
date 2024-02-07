# Python Docker Cron Job

This repo is an implementation of a Dockerized Python cron job that utilizes environment variables.

As there is no direct approach to access environment variables in such an environment, this workaround should work

**Ensure that the crontab and run.sh files have 'LF' as their EOL character**

Build the docker container
```
docker-compose build
```

Run the container
```
docker-compose up
```