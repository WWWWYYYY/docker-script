#redis
docker volume create redis
docker run --restart=always  --name redis -p 6379:6379 -v redis:/data -v /etc/localtime:/etc/localtime:ro  -d redis:latest redis-server --appendonly yes
