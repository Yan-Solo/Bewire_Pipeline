#!/bin/bash

# Kill any running dockers
docker rm $(docker ps -aq) -f

# Restore backup volumes
rsync -azvlogp ~/Documents/School/Bewire/backup/* /var/lib/docker/volumes/

# Start pipeline
docker-compose -f ~/Documents/School/Bewire/Pipeline/docker-compose.yml up -d --force-recreate

# Put gitlab backup back in place
echo restoring gitlab backup
sleep 60
docker exec $(docker ps | grep gitlab | cut -d ' ' -f 1) gitlab-rake gitlab:backup:restore
rm -rf /var/lib/docker/volumes/pipelin_gitlab_data_backups/_data/*

## Delete this after the test
