# 🐳 Docker Project for pmn studies

## Project Description

This is a complete stack for running Symfony 5 into a bulk of containers managing by docker-compose tool.

Our hub is composed from 3 nodes: 

- `nginx`, acting as a gateway dispatcher between containers + load_balancer  in (prod version).
- `php_server`, the PHP-FPM container with 7.4 PHPversion, it includes the composer tool. (composer to be devided to another container in the coming verion)
- `db_` which is the MySQL database container with a **MySQL 8.0** image.

There is a .env structure file without datas in the file **.env.struct**

#### Still in the way :
refactoring the code && add comments.
add docekr.compose.prod.yml for prod testing.
separate composer from php server.
complete readme :)


