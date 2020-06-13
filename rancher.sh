docker run  --name rancher -d --restart=unless-stopped -p 9090:80 -p 9443:443 \
-v /etc/localtime:/etc/localtime:ro \
-v rancher:/var/lib/rancher/ -v rancher-auditlog:/var/log/auditlog \
-e CATTLE_SYSTEM_CATALOG=bundled -e AUDIT_LEVEL=3 rancher/rancher:stable
