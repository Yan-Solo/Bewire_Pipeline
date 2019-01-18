#!/bin/bash

# Variables
dir=$1
backup='project14@192.168.1.4'

# Make backup folder if it doensn't already exist
mkdir -p /home/$USER/pipeline_backup

if [[ $dir == '/var/lib/docker/volumes' ]]; then
  echo backup up gitlab...
  docker exec $(docker ps | grep gitlab | cut -d ' ' -f 1) gitlab-rake gitlab:backup:create
else
  echo "couldn't find gitlab to backup"
fi

rsync -azvlogp $dir/*pipeline* /home/$USER/pipeline_backup


## SSH TUNNEL
