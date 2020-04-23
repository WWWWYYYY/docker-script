docker volume create nexus
docker run -d --name nexus3 --restart=always -p 8001:8081 -p 5000:5000 -v nexus:/nexus-data -v /etc/localtime:/etc/localtime:ro -u root sonatype/nexus3


# mkdir -p /docker_data/nexus3
#docker run -d --name nexus3 --restart=always -p 8001:8081 -p 5000:5000 -v /docker_data/nexus3:/nexus-data -v /etc/localtime:/etc/localtime:ro -u root sonatype/nexus3
#浏览器访问ip:8001
