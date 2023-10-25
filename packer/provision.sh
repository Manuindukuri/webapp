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
