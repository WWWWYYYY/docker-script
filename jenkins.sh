#jenkins
docker volume create jenkins
docker run --name jenkins -d -p 8080:8080 -p 50000:50000 -v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock -v jenkins:/var/jenkins_home -v /etc/localtime:/etc/localtime:ro -u root registry.cn-shenzhen.aliyuncs.com/wyrancher/jenkins-maven/jenkins
#加速配置  cd {你的Jenkins工作目录}/updates && sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' default.json
