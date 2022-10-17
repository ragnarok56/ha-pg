FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y python3-pip python3-psycopg2

COPY demo.py pgpass /

ENV PGHOST=haproxy \
    PGUSER=app_user \
    PGDATABASE=postgres

CMD ["python3", "/demo.py"]