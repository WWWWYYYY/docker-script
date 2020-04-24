#mysql
mkdir -p /docker_data/mysql/conf
mkdir -p /docker_data/mysql/log
mkdir -p /docker_data/mysql/data
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
docker run -p 3306:3306 --name mysql-5.7 -v /docker_data/mysql/conf:/etc/mysql -v /docker_data/mysql/log:/var/log/ -v /docker_data/mysql/data:/var/lib/mysql -v /etc/localtime:/etc/localtime:ro -e MYSQL_ROOT_PASSWORD=123456 -u root -d mysql:5.7
