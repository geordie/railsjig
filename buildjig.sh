#!/bin/bash
set -e

docker-compose run web rails new . --force --no-deps --database=mysql

docker-compose run web sed -i '0,/password:/s/password:/password: password/' config/database.yml

docker-compose run web sed -i '0,/host: localhost/s/host: localhost/host: db/' config/database.yml

docker-compose build

