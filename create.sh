#!/bin/sh

if [ "$1" = "--name" -a "$2" != "" ]
then
    name=$2
else
    echo "Not name. Exit."
    echo "Add name like '--name server_name'"
    exit
fi

gcloud compute instances create $name \
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --zone=europe-west1-d \
  --metadata-from-file startup-script=./startup_script.sh
