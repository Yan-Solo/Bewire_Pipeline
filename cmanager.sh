#!/bin/bash

dirs=(ls -d */)

if [[ $1 == "up" ]]; then
  action="up -d"
  trying="Bringing up"
  success="starting"
elif [[ $1 == "down" ]]; then
  action="down"
  trying="Bringing down"
  success="down"
else
  printf "Error - Correct usage is \"up\" for up or \"down\" for down\n"
  exit 1
fi

for dir in ${dirs[*]}
do
  printf "$trying $dir...\n"
  `cd containers/$dir/ && docker-compose $action`
  printf "Success. Container $dir is $success\n\n"
done
