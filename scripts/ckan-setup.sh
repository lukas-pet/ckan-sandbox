#!/bin/bash

sudo apt update && uv pip install --upgrade pip

# Install the dependancy packages that CKAN requires
sudo apt install python3-dev libpq-dev python3-pip python3-venv git-core redis-server libmagic1

sudo apt install -y postgresql

sudo service postgresql start

echo "Creating ckan_default database user. You will be prompted to enter a password."

#Quick workaround to not ask for container admin password when inpersonating the postgres user
sudo su postgres -c "createuser -S -D -R -P ckan_default"

sudo su postgres -c "createdb -O ckan_default ckan_default -E utf-8"



# ckan generate config ./ckan_server/default/ckan.ini

