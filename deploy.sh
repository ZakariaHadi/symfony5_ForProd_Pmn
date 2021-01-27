# This script is added to handle the ssh connection with ec2 instance from aws and 
# pull the docker images in there and lanch services with docker-compose

#!/bin/sh

ssh -o StrictHostKeyChecking=no ec2-user@$EC2_PUBLIC_IP_ADDRESS << 'ENDSSH'
  cd /home/ec2-user/app
  export $(cat .env.prod | xargs)
  docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
  docker pull $PHP_IMAGE
  docker pull $NGINX_IMAGE
  docker-compose -f docker-compose.prod.yml up -d
ENDSSH