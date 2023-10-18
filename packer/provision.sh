#!/usr/bin/env bash

set -eo pipefail

# system libraries
sudo apt-get update
sudo apt-get -y install python3 python3-pip libpq-dev python3-virtualenv wget

# install postgres
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql-14

# export variables
export POSTGRES_USER=${POSTGRES_USER}
export POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
export POSTGRES_DB=${POSTGRES_DB}
export POSTGRES_PORT=${POSTGRES_PORT}
export POSTGRES_HOST=${POSTGRES_HOST}

# Create postgres user
sudo su - postgres <<EOF
psql -c "CREATE database ${POSTGRES_DB}"
psql -c "CREATE USER ${POSTGRES_USER} WITH PASSWORD '${POSTGRES_PASSWORD}';"
psql -c "GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_DB} TO ${POSTGRES_USER};"
EOF
sudo sed -i 's/\(scram-sha-256\|ident\|peer\)/md5/g' /etc/postgresql/14/main/pg_hba.conf
sudo systemctl restart postgresql


# Install requirements
cd /home/admin/webapp
sudo cp user.csv /opt/
sudo chmod 755 /opt/user.csv
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
virtualenv venv
pip3 install -r requirements.txt
source venv/bin/activate
pip3 install -r requirements.txt

# webapp system service
sudo cp packer/webapp.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable webapp.service
sudo systemctl start webapp.service
