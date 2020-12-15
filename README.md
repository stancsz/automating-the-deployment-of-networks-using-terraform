# SILO Quick Starts
## setup swapfile 4GB
```bash
wget -O - https://raw.githubusercontent.com/stancsz/sre-devops-practice/master/linux-create-swapfile/create-linux-swapfile.sh | bash
```


## mysql setup
```bash
wget -O - https://raw.githubusercontent.com/stancsz/sre-devops-practice/master/mysql-setup/mysql-db-setup.sh | bash
```
```
# Extra Instructions
### Comment out **** bind-address = 127.0.0.1 **** by using
vi /etc/mysql/mysql.conf.d/mysqld.cnf
# or with
vi /etc/mysql/my.cnf

# Create users:
sudo mysql --execute=CREATE USER 'admin01'@'localhost' IDENTIFIED BY 'adminpassw0rd';
sudo mysql --execute=GRANT ALL PRIVILEGES ON *.* TO 'admin01'@'localhost' WITH GRANT OPTION;
sudo mysql --execute=CREATE USER 'admin01'@'%' IDENTIFIED BY 'adminpassw0rd';
sudo mysql --execute=GRANT ALL PRIVILEGES ON *.* TO 'admin01'@'%' WITH GRANT OPTION;
```


[howto](https://askubuntu.com/questions/992448/how-to-execute-a-bash-script-from-github)