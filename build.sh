#!/bin/bash

echo "Building Docker image: react-app ..."
sudo docker build -t react-app:latest .
if [ $? -eq 0 ]; then
  echo "Docker image built successfully."
else
  echo "Docker image build failed."
fi
