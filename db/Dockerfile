FROM postgres:13

# Install `gawk` to run the `transform.awk` file.
# Install `postgresql-13-postgis-3` and `postgis` to add on the PostGIS extension.
RUN apt-get update
RUN apt-get -y install gawk
RUN apt-get -y install postgresql-13-postgis-3
RUN apt-get -y install postgis

# Run `create.sql` on init.
# This extends the official Postgres image by adding a SQL file to the “docker-entrypoint-initdb.d” directory in the container.
# Additional initialization for an image derived from the postgres image.
COPY create.sql /docker-entrypoint-initdb.d