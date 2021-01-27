# 🐳 Docker Project for pmn studies

## Project Description

This is a complete stack for running Symfony 5 into a bulk of containers managing by docker-compose tool.

Our hub is composed from 3 nodes: 

- `nginx`, acting as a gateway dispatcher between containers + load_balancer  in (prod version).
- `php_server`, the PHP-FPM container with 7.4 PHPversion, it includes the composer tool. (composer to be devided to another container in the coming verion)
- `db_` which is the MySQL database container with a **MySQL 8.0** image.

There is an empty .env structure file without data in the file **.env.struct** || **./symfony/.env.struct**

### Setting Environments up : 
- All the configs for the dev env are set in the default confs files (docker-compose.yml && Dockerfile && nginx.conf ...)
- The dockerfiles of all the services have the same configs for both environments.
- **docker-compose.prod.yml** contains the sevices definitions for a prod env which doesn't need handling the build process from a Dockerfile since we have pushed already our images to the docker hub. so only the changed params are exported as a env params in the **.env.prod** file.
- Deployment still in test since I have some connection issues with the aws provided load balancer.
- **deploy.sh** is a used in the deployment stage to establish the ssh connection between the gitlab builder instance and the ec2 instance and launch the services with docker-compose. (see the **.gitlab-ci.yml** file)
- **setup_env.sh** script is responsible for handling the environments vars from the repository CI/CD configuration in gitlab and passe it to **.env.prod** && **symfony/.env** files which are used as input env files in php/nginx services. (please lookup => docker-compose.prod.yml)

### Important :
- The deployment pipeline is lanched from a gitlab build context so the deployment configuration is managed for a gitlab CI/CD. (just familiarisation issue :) )

- The two repositories in github and gitlab are connected, and each push to the release-pre-prod branch will trigger the build/deploy stages pipelines in the gitlab ci/cd process.

#### Still in the way :
- php Dockerfile => create a stage just for build dependencies and use it as builder layer just to copy the built wheels.
- add unit tests for the symfony app.
- finalize the deployement tests.


