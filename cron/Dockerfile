FROM python:3.12
RUN apt-get update && apt-get -y install cron vim

WORKDIR /app
COPY crontab /etc/cron.d/crontab
COPY main.py /app/main.py
COPY requirements.txt /app/requirements.txt
COPY run.sh /app/run.sh

RUN python -m venv venv
ENV PATH="/app/venv/bin:$PATH"
RUN pip install --no-cache-dir -r /app/requirements.txt

RUN chmod 0644 /etc/cron.d/crontab
RUN /usr/bin/crontab /etc/cron.d/crontab

# run crond as main process of container
RUN ln -sf /proc/1/fd/1 /var/log/cron.log

RUN chmod +x "/app/run.sh"
ENTRYPOINT ["/app/run.sh"]
