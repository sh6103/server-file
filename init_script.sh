#!/bin/sh

# This script will be executed as the user 'postgres'

# echo 'Restoring the initial db to namayeyar raw database...'
# pg_restore --dbname=namayeyar --verbose --clean < /docker-entrypoint-initdb.d/init_namayeyar.custom

echo "Creating user ${NAMAYEYAR_DB_USER}..."
psql --command="CREATE USER ${NAMAYEYAR_DB_USER} WITH PASSWORD '${NAMAYEYAR_DB_PASS}';" postgres postgres

echo "Getting the createdb permission to user ${NAMAYEYAR_DB_USER} for tests..."
psql --command="ALTER USER ${NAMAYEYAR_DB_USER} CREATEDB;"

echo "Creating database ${NAMAYEYAR_DB}..."
psql --command="create database ${NAMAYEYAR_DB};" postgres postgres

echo "GRANT ALL PRIVILEGES ON DATABASE ${NAMAYEYAR_DB} TO ${NAMAYEYAR_DB_USER}"
psql --command="GRANT ALL PRIVILEGES ON DATABASE ${NAMAYEYAR_DB} TO ${NAMAYEYAR_DB_USER};" postgres postgres
