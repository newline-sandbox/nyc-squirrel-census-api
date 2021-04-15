# NYC Squirrel Census API

This server-side application consists of an Express.js API, a PostgreSQL database and pgAdmin. The database is seeded with the dataset of the [2018 Central Park Squirrel Census](https://data.cityofnewyork.us/Environment/2018-Central-Park-Squirrel-Census-Squirrel-Data/vfnx-vebw).

Add a `.env.development` file with the following environment variables to run this application:

```
# Environment Variables for the Express.js API
NYCSC_API_PORT=8080 # Or a different port if you already have an application running on this port.
NYCSC_API_CLIENT_APP_URL=http://localhost:3000 # Or whatever domain the create-react-app front-end can be accessed from.

# Environment Variables for the PostgreSQL Database
NYCSC_PG_DB=nyc_squirrels
NYCSC_PG_DB_USER=postgres_user # Replace "postgres_user" with a unique username.
NYCSC_PG_DB_PASSWORD=postgres_password # Replace "postgres_password" with a strong password. 

# Environment Variables for pgAdmin
NYCSC_PGADMIN_EMAIL=emailaddress@service.com # Replace "emailaddress@service.com" with your e-mail address.
NYCSC_PGADMIN_PASSWORD=pgadmin_password # Replace "pgadmin_password" with a strong password.
```