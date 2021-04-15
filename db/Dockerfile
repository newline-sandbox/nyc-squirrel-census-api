FROM postgres

# Run `create.sql` on init.
# This extends the official Postgres image by adding a SQL file to the “docker-entrypoint-initdb.d” directory in the container.
# Additional initialization for an image derived from the postgres image.
COPY create.sql /docker-entrypoint-initdb.d