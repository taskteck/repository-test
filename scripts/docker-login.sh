#!/usr/bin/env bash 

if [ -d /dockerhub-credentials ]; then
  USER=$(cat /dockerhub-credentials/username)
  PASSWORD=$(cat /dockerhub-credentials/token)
  
  echo "$PASSWORD" | docker login -u "$USER" --password-stdin
fi
