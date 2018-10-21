#!/bin/sh

if [ "$1" = "--name" -a "$2" != "" ]
then
    name=$2
else
    echo "Not name. Exit."
    echo "Add name like '--name server_name'"
    exit
fi

gcloud compute instances create zxczxc \
  --boot-disk-size=10GB \
  --image-family=reddit-full \
  --image-project=infra-219521 \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --zone=europe-west1-b \
  --metadata startup-script='cd ~/reddit && puma -d'
