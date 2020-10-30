#!/usr/bin/bash
echo "Goodmorning Taxt Docker Image Building ~"
docker build --tag mysql-taxi .
echo "Goodmorning Taxt Docker Container Run ~"
docker run -d -p 3306:3306 --name db -e MYSQL_ROOT_PASSWORD=qwer1234 mysql-taxi
