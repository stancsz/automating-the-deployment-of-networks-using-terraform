#!/bin/bash
# sudo apt update
# sudo apt install -y mysql-server
# sudo mysql_secure_installation

echo "# Extra Instructions"
echo "### Comment out **** bind-address = 127.0.0.1 **** by using"
echo "vi /etc/mysql/mysql.conf.d/mysqld.cnf"
echo "or with"
echo "vi /etc/mysql/my.cnf"

echo "Create users:"
echo sudo mysql --execute="CREATE USER 'admin01'@'localhost' IDENTIFIED BY 'adminpassw0rd';"
echo sudo mysql --execute="GRANT ALL PRIVILEGES ON *.* TO 'admin01'@'localhost' WITH GRANT OPTION;"
echo sudo mysql --execute="CREATE USER 'admin01'@'%' IDENTIFIED BY 'adminpassw0rd';"
echo sudo mysql --execute="GRANT ALL PRIVILEGES ON *.* TO 'admin01'@'%' WITH GRANT OPTION;"