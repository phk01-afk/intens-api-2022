#!/bin/bash

ssh -o StrictHostKeyChecking=no -i ~/.ssh/ec2_key.pem $EC2_USERNAME@$EC2_HOST << EOF
  echo "$DOCKERHUB_TOKEN" | docker login -u $DOCKERHUB_USERNAME --password-stdin

  docker pull $DOCKERHUB_USERNAME/intens-api:$IMAGE_TAG

  docker stop intens-api || true
  docker rm intens-api || true

  docker run -d -p 8080:8080 --name intens-api $DOCKERHUB_USERNAME/intens-api:$IMAGE_TAG

  docker logout
EOF
