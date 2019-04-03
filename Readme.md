### Docker image for create postgresql database
Image based on image postgresql 11
This image create dumpfile with remote database, and init new database in container

Image for safety testing PROD database or any instances
You have actuality database in container (clone)


Image using ENV

POSTGRES_USER  - User for remote database and for Owner container database \
POSTGRES_PASSWORD  -password for remote database and for Owner container database \
RM_HOST  - Remote server \
RM_PORT  - remote port server \
DB_NAME - Database Name for remote and container name

#### Run service

```bash
docker-compose -f docker-compose.yml up
```

#### build image
```bash
docker build --rm -f "./Dockerfile" -t db-postgres:latest .
```

#### run container

For example
```bash
docker run -d -p 5432:5432 -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=jw8s0F4 -e RM_HOST=172.17.0.3 -e RM_PORT=5432 -e DB_NAME=database --name postgres db-postgres
```
docker-compose
```
PostgreSQL:
  container_name: postgres
  image: db-migration
  ports:
    - "5432:5432"
  environment:
    - POSTGRES_USER=admin
    - POSTGRES_PASSWORD=jw8s0F4
    - RM_HOST=172.17.0.3
    - RM_PORT=5432
    - DB_NAME=database
```

### Shell access 
```
docker exec -it postgres bash
```

### psql access
```
psql -U POSTGRES_USER
```

You cun uncomment lines in Dockerfile, if you needded having postgis on database
#RUN apt update \
#    && apt-get install postgis postgresql-11-postgis-scripts -y
