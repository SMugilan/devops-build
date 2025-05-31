#!/bin/bash

echo "Stopping old container if running..."
sudo docker stop react-app-container 2>/dev/null
sudo docker rm react-app-container 2>/dev/null

echo "Starting new container..."
sudo docker run -d -p 80:80 --name react-app-container react-app:latest

if [ $? -eq 0 ]; then
  echo "Deployment successful."
else
  echo "Deployment failed."
fi
