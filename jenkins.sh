#jenkins
docker volume create jenkins
docker run --name jenkins -d -p 8080:8080 \
-p 50000:50000 \
-v /usr/lib64/libltdl.so.7:/usr/lib/x86_64-linux-gnu/libltdl.so.7 \
-v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock \
-v jenkins:/var/jenkins_home \
-v /etc/localtime:/etc/localtime:ro \
-u root registry.cn-shenzhen.aliyuncs.com/wyrancher/jenkins-maven/jenkins
#加速配置  cd {你的Jenkins工作目录}/updates && sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' default.json



#在容器中 使用docker命令时发现 docker: error while loading shared libraries: libltdl.so.7: cannot open shared object file: No such file or directory
解决方法：
找到宿主机的libltdl.so.7文件的位置挂载到容器中
 find / -name libltdl.so.7
 /usr/lib64/libltdl.so.7
 然后在docker run 命令上添加以下参数
-v /usr/lib64/libltdl.so.7:/usr/lib/x86_64-linux-gnu/libltdl.so.7

如果jenkins中需要用到ssh或者scp命令的话可以挂载宿主机的ssh信息，前提是宿主机已经和远程主机做了免密。
 -v /root/.ssh:/root/.ssh 
