#mysql
mkdir -p /docker_data/mysql/conf
cat <<EOF > /docker_data/mysql/conf/my.cnf
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
lower_case_table_names =1
symbolic-links=0
log-error=/var/log/mysqld.log
character_set_server=utf8mb4
max_connections = 1024
skip-name-resolve
pid-file=/var/run/mysqld/mysqld.pid
server-id=1
EOF

docker run -p 13306:3306 --name mysql-5.7   \
-v /docker_data/mysql/conf:/etc/mysql \
-v mysql-log:/var/log/ \
-v mysql-data:/var/lib/mysql \
-v /etc/localtime:/etc/localtime:ro -e MYSQL_ROOT_PASSWORD=123456 -u root -d mysql:5.7


#进入容器 配置允许远程连接
mysql -u root -p 123456
grant all privileges on *.*  to ‘root’@’%’ ; 
