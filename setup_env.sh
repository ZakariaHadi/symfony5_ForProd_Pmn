# This script is responsible for handling the environments vars from the repository CI/CD configuration in gitlab and passe it
# to .env.prod && symfony/.env.prod file which is used as input env file in php/nginx services. (please lookup => docker-compose.prod.yml)

#CI images builder configs
echo WEB_IMAGE=$IMAGE:php  >> .env.prod
echo NGINX_IMAGE=$IMAGE:nginx  >> .env.prod
echo CI_REGISTRY_USER=$CI_REGISTRY_USER   >> .env.prod
echo CI_JOB_TOKEN=$CI_JOB_TOKEN  >> .env.prod
echo CI_REGISTRY=$CI_REGISTRY  >> .env.prod
echo IMAGE=registry.gitlab.com/zakariahadi/symfony5_forprod_pmn >> .env.prod

echo MYSQL_ROOT_PASSWORD >> .env.prod
echo MYSQL_DATABASE >> .env.prod
echo MYSQL_USER >> .env.prod
echo MYSQL_PASSWORD >> .env.prod
echo SQL_DATABASE >> .env.prod
echo MYSQL_HOST >> .env.prod
echo MYSQL_PORT >> .env.prod

echo APP_ENV >> ./symfony/.env.prod
echo  APP_SECRET >> ./symfony/.env.prod

echo DATABASE_SERVER_VERSION >> ./symfony/.env
echo DATABASE_HOST >> ./symfony/.env
echo DATABASE_PORT >> ./symfony/.env
echo DATABASE_USER >> ./symfony/.env
echo MYSQL_ROOT_PASSWORD >> ./symfony/.env
echo DATABASE_NAME >> ./symfony/.env