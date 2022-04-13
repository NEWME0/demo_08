FROM python:3.9

RUN apt-get update && \
    apt-get install -y curl telnet net-tools iputils-ping libpq-dev gcc python3-cffi &&  \
    apt-get clean autoclean &&  \
    apt-get autoremove --purge -y &&  \
    rm -rf /var/lib/apt/lists/* &&  \
    rm -f /var/cache/apt/archives/*.deb

COPY ./src /usr/app/
COPY ./requirements.txt /usr/app

WORKDIR /usr/app

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install uvicorn

RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /root/.cache/*
RUN rm -rf /tmp/*
RUN apt-get -y autoremove --purge  \
    && \
    apt-get -y autoclean &&  \
    apt-get -y clean
RUN rm -rf /usr/share/man/*
RUN rm -rf /usr/share/doc/*
RUN find /var/lib/apt -type f | xargs rm -f
RUN find /var/cache -type f -exec rm -rf {} \;
RUN find /var/log -type f | while read f; do echo -ne '' > $f; done;

EXPOSE 8080

ENTRYPOINT ['uvicorn', '--host', '0.0.0.0', '--port', '8080', '--reload']
