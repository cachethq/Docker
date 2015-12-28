Run [Cachet](https://github.com/cachethq/Cachet) status page in a Docker container.

For full documentation, visit the Cachet Documentation page:
- [Getting started with Cachet in Docker](https://docs.cachethq.io/docs/get-started-with-docker)

# Automated build
`cachethq/docker` is available as a [Docker Hub Trusted Build](https://hub.docker.com/r/cachethq/docker/)

To pull the `latest` tag from the Docker Hub:
```bash
docker pull cachethq/docker:latest
```

To pull a specific version from the Docker Hub:
```bash
docker pull cachethq/docker:2.0
```

# Quickstart
## Database
Cachet uses a database backend to store its data. You can configure this image to use either MySQL or PostgreSQL.

Note: Cachet recommends using PostgreSQL over MySQL

## PostgreSQL
```bash
docker run --name pgsql -e POSTGRES_USER=cachet -e POSTGRES_PASSWORD=cachet postgres:9.4.4
docker run -d --name cachet --link pgsql:pgsql -p 80:8000 -e DB_DRIVER=pgsql -e DB_HOST=pgsql -e DB_DATABASE=cachet -e DB_USERNAME=cachet -e DB_PASSWORD=cachet cachethq/docker:latest
```

### MySQL
```bash
docker run --name mysql -e MYSQL_USER=cachet -e MYSQL_PASSWORD=cachet  -e MYSQL_ROOT_PASSWORD=cachet -e MYSQL_DATABASE=cachet -d mysql
docker run -d --name cachet --link mysql:mysql -p 80:8000 -e DB_HOST=mysql -e DB_DATABASE=cachet -e DB_USERNAME=cachet -e DB_PASSWORD=cachet cachethq/docker:latest
```

# docker-compose quickstart
Docker compose can also be used to automatically setup the Database and Cachet containers.

```bash
docker-compose up
```
