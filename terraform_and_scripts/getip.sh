#!/bin/bash
ImageName=$1
ID=$(docker ps |grep "$ImageName" |tail -n 1 | cut -d ' ' -f1)

docker inspect "$ID" | jq  '.[] .NetworkSettings .IPAddress' | tr -d '"'

