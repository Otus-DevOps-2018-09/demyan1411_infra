#!/bin/sh
set -xe

APP_DIR=${1:-$HOME}

git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install

# cd /home/appuser
# git clone -b monolith https://github.com/express42/reddit.git /home/appuser/reddit
# cd /home/appuser/reddit
# bundle install

echo "======================== puma.service =============================="
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
echo "===================================================================="

sudo systemctl start puma
sudo systemctl enable puma
