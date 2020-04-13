#sonar
docker volume create pgdata
docker volume create sonarqube-data
docker volume create sonarqube-log
docker volume create sonarqube-extensions
docker run --name db -d --rm  -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -e POSTGRES_DB=sonar -v pgdata:/var/lib/postgresql/data -p 5432:5432 postgres   
docker run --name sq -d --link db -e SONARQUBE_JDBC_URL=jdbc:postgresql://db:5432/sonar  -e SONARQUBE_JDBC_USERNAME=sonar -e SONARQUBE_JDBC_PASSWORD=sonar -p 9000:9000 -v sonarqube-data:/opt/sonarqube/data -v sonarqube-log:/opt/sonarqube/log -v sonarqube-extensions:/opt/sonarqube/extensions sonarqube
