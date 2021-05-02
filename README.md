# NYC Squirrel Census API

![](https://www.dl.dropboxusercontent.com/s/e4tm9g9vjnm67wv/screenshot-6t93219.png)

This server-side application consists of an Express.js API, a PostgreSQL database and pgAdmin. The database is seeded with the dataset of the [2018 Central Park Squirrel Census](https://data.cityofnewyork.us/Environment/2018-Central-Park-Squirrel-Census-Squirrel-Data/vfnx-vebw).

The API runs locally at [http://localhost:8080/](http://localhost:8080/), and it offers the following endpoints:

* `GET /tables` - Returns low-level information about the `nyc_squirrels` database's tables.
* `POST /api/records` - Returns data from the PostgreSQL database based on a query object sent within the incoming request.

## Project Setup

Add a `.env.development` file with the following environment variables to run this application:

```
# Environment Variables for the Express.js API
NYCSC_API_PORT=8080 # Or a different port if you already have an application running on this port.
NYCSC_API_CLIENT_APP_URL=http://localhost:3000 # Or whatever domain the create-react-app front-end can be accessed from.
NYCSC_API_DEV_MODE=true # Set this to `true` to disable TLS/SSL connections to the PostgreSQL database.

# Environment Variables for the PostgreSQL Database
NYCSC_PG_DB=nyc_squirrels
NYCSC_PG_DB_USER=postgres_user # Replace "postgres_user" with a unique username.
NYCSC_PG_DB_PASSWORD=postgres_password # Replace "postgres_password" with a strong password. 

# Environment Variables for pgAdmin
NYCSC_PGADMIN_EMAIL=emailaddress@service.com # Replace "emailaddress@service.com" with your e-mail address.
NYCSC_PGADMIN_PASSWORD=pgadmin_password # Replace "pgadmin_password" with a strong password.
```

## Running the Application

Run the multi-container Docker application:

```shell
$ export DOCKER_COMPOSE_ENV_FILE=./.env.development
$ docker-compose --env-file $DOCKER_COMPOSE_ENV_FILE build --force-rm --no-cache && docker-compose --env-file $DOCKER_COMPOSE_ENV_FILE up --detach && docker-compose --env-file $DOCKER_COMPOSE_ENV_FILE logs --follow
```

Verify that the application is properly running by navigating to `localhost:<NYCSC_API_PORT>/tables` within your browser. 

![](https://www.dl.dropboxusercontent.com/s/euzcn08paihkugw/screenshot-fjfe803j0.png)

To visually interact with this API, clone the repository of the client-side application [react-query-builder-demo](https://github.com/newline-sandbox/react-query-builder-demo) and follow the directions in the `README.md` file to run it locally alongside this application.