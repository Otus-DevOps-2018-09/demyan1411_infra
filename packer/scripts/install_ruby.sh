#!/bin/sh
set -e

apt update
apt install -y ruby-full ruby-bundler build-essential

echo "======================================================================================"
echo "==================================Ruby & Bundler wversions============================"
echo "======================================================================================"
ruby -v
bundle -v
echo "======================================================================================"
echo "======================================================================================"
echo "======================================================================================"
