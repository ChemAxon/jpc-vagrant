#!/bin/bash

/etc/init.d/postgresql start 
psql --command "CREATE EXTENSION chemaxon_type;" 
psql --command "CREATE EXTENSION hstore;" 
psql --command "CREATE EXTENSION chemaxon_framework;" 
psql --command "ALTER USER postgres with password 'postgres';"