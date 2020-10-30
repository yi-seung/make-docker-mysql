USE management;
CREATE TABLE CUSTOMER (
       id INT PRIMARY KEY AUTO_INCREMENT,
       image VARCHAR(1024),
       name VARCHAR(64),
       email VARCHAR(64),
       text VARCHAR(1024),
       coin VARCHAR(64)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
