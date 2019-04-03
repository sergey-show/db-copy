FROM postgres:11
LABEL maintainer="Sergey Chugay <sergey@chugay.ru>"

ARG POSTGRES_USER=admin
ARG POSTGRES_PASSWORD=jw8s0F4
ARG RM_HOST=localhost
ARG RM_PORT=5432
ARG DB_NAME=database

ENV POSTGRES_USER=${POSTGRES_USER} \
    POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    RM_HOST=${RM_HOST} \
    RM_PORT=${RM_PORT} \
    DB_NAME=${DB_NAME}

ENV PATH $PATH:/usr/local/bin

# You cun uncomment this lines, if you needded having postgis on database
#RUN apt update \
#    && apt-get install postgis postgresql-11-postgis-scripts -y

RUN touch dump_base.sql prepaire.sql
RUN chown postgres:postgres *.sql
COPY docker-entrypoint.sh /usr/local/bin/
RUN unset PGPASSWORD

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh

USER postgres

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]
