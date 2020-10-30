#!/bin/bash

if [ -z $MYSQL_ROOT_PASSWORD ]; then
  exit 1
fi

mysql_install_db --user mysql > /dev/null

cat > /tmp/sql <<EOF
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
UPDATE user SET password=PASSWORD("$MYSQL_ROOT_PASSWORD") WHERE user='root';
CREATE DATABASE management default CHARACTER SET UTF8;
USE management;
CREATE TABLE CUSTOMER ( id INT PRIMARY KEY AUTO_INCREMENT, image VARCHAR(1024), name VARCHAR(64), email VARCHAR(64), text VARCHAR(1024), coin VARCHAR(64)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
COMMIT;
INSERT INTO CUSTOMER VALUES (1, 'https://placeimg.com/64/64/1', '홍길동', '960508@korea.kr', 'Good Morning Taxi !!', '10');
INSERT INTO CUSTOMER VALUES (2, 'https://placeimg.com/64/64/2', '나동빈', '961222@korea.kr', '광고문구 ~', '100');
INSERT INTO CUSTOMER VALUES (3, 'https://placeimg.com/64/64/3', '이순신', '961127@korea.kr', 'React Ads System', '1000');
EOF

mysqld --bootstrap --verbose=0 < /tmp/sql
rm -rf /tmp/sql

mysqld
