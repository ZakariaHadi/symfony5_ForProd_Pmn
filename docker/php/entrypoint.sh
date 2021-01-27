#!./bin/bash
echo "Waiting for mysql..."
## SECTION I: RELATED SERVERS CHECKS
if [ "$SQL_DATABASE" = "mysql" ]
then
    echo "Waiting for mysql..."
    while ! nc -z $MYSQL_HOST $MYSQL_PORT; do
      sleep 0.1
    done
    echo "mysql started"

fi

exec "$@"