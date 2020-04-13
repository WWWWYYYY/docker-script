#redis
docker volume create redis
docker run --restart=always  --name redis -p 6379:6379 -v redis:/data  -d redis:latest redis-server --appendonly yes
