#!/bin/bash

CONTAINER_NAME="nutanix-app-container"
IMAGE_NAME="nutanix-app"
PORT_MAPPING="5001:5000"

while true; do
  # Check if container is running
  RUNNING_ID=$(docker ps -q --filter "name=$CONTAINER_NAME")

  if [ -z "$RUNNING_ID" ]; then
    echo "App down! Attempting recovery..."

    # Check if container exists but stopped
    EXISTING_ID=$(docker ps -aq --filter "name=$CONTAINER_NAME")

    if [ -n "$EXISTING_ID" ]; then
      echo "Restarting existing container..."
      docker start $CONTAINER_NAME
    else
      echo "Creating and starting new container..."
      docker run -d --name $CONTAINER_NAME -p $PORT_MAPPING $IMAGE_NAME
    fi
  else
    # Optional: health check via curl
    curl -s http://localhost:5001 > /dev/null
    if [ $? -ne 0 ]; then
      echo "App unhealthy! Restarting container..."
      docker restart $CONTAINER_NAME
    fi
  fi

  sleep 5
done