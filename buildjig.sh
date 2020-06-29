#!/bin/bash
set -e

usage()
{
	echo "usage: railsjig [[[-p password ] [--port port]] | [-h]]"
}

##### Main

pw=password
port=80

while [ "$1" != "" ]; do
	case $1 in
		-p | --password )		shift
								pw=$1
								;;
		--port )				shift
								port=$1
								;;
		-h | --help )			usage
								exit
								;;
		* )						usage
								exit 1
	esac
	shift
done

## Create a new rails project with MySQL as the database 
## in the docker container
docker-compose run web rails new . --force --no-deps --database=mysql

## Replace localhost as the default development database host
##  with the docker db host
docker-compose run web sed -i '0,/host: localhost/s/host: localhost/host: db/' config/database.yml

## Set passwords for the database
docker-compose run web sed -i "0,/password:/s/password:/password: $pw/" config/database.yml
docker-compose run web sed -i "0,/=password/s/=password/=$pw/" docker-compose.yml

# Build again
docker-compose build

# Clean up
docker-compose down

