#!/bin/sh
set -xe

#Simple script for deploying our awesome app

git clone -b monolith https://github.com/express42/reddit.git /home/appuser/reddit
cd /home/appuser/reddit
bundle install

# echo "======================================================================================"
# echo "================================= Start Puma ========================================="
# echo "======================================================================================"
# cat <<EOF > /etc/systemd/system/puma.service
# [Unit]
# Description=Puma Server
# After=network.target
#
# [Service]
# Type=simple
# User=appuser
# WorkingDirectory=/home/appuser/reddit
# ExecStart=/bin/bash -lc "/usr/local/bin/puma -C /home/appuser/reddit/config/deploy/production.rb"
# Restart=always
#
# [Install]
# WantedBy=multi-user.target
# EOF
#
# chmod 764 /etc/systemd/system/puma.service
# systemctl daemon-reload
# systemctl enable puma.service
# systemctl start puma.service
# systemctl status puma.service
# echo "======================================================================================"
# echo "======================================================================================"
# echo "======================================================================================"
