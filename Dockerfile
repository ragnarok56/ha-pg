ARG PG_MAJOR=11

FROM postgres:$PG_MAJOR

ARG PGHOME=/var/lib/postgresql

# set this to /var/lib/postgresql/data2 because
# i cant figure out how to get the permissions assigned correctly
# for /var/lib/postgresql/data
ENV PGDATA=$PGHOME/data2

WORKDIR $PGHOME

RUN apt-get update \
    && apt-get install -y python3-pip python3-psycopg2 \
    && pip3 install patroni[consul] \
    && mkdir -p $PGDATA \
    && chmod -R 700 $PGDATA \
    && chown postgres:postgres $PGDATA

USER postgres

CMD ["patroni", "/postgres.yml"]