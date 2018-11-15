#!/bin/sh
set -xe

APP_DIR=$HOME
DATABASE_URL=$1

git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install

echo "======================== puma.service =============================="
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo sed -i "s/Environment=/Environment=DATABASE_URL=$DATABASE_URL/" /etc/systemd/system/puma.service
echo "===================================================================="

sudo systemctl start puma
sudo systemctl enable puma
