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


# Install cloud watch agent
sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/debian/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

# Create user
sudo adduser --disabled-password --gecos "" manohar
sudo cp -r /home/admin/webapp /home/manohar/webapp
sudo chown -R manohar:manohar /home/manohar/webapp

echo "manohar ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers


# Install requirements

sudo -i -u manohar bash << EOF
cd /home/manohar/webapp
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

EOF
