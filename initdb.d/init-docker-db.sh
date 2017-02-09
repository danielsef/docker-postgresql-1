#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 -h 127.0.0.1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<-EOSQL
    CREATE USER taskfit with LOGIN PASSWORD 'pass1234';
    CREATE DATABASE taskfitdb;
    GRANT ALL PRIVILEGES ON DATABASE taskfitdb TO taskfit;
EOSQL
