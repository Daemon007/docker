
# 使用 Docker 构建计算核算pptp服务

环境准备：
Oracle Client 镜像： daemonzjf/oracle-ee-11g-client-base
安装包：
install/
├── Apache2.tar
├── axis2c-1.6.0.tar
├── Common
├── Install.sh
├── pptp-conf
├── pptp_install.sh
├── xQuantETL
├── xQuantPP
└── xQuantTp

## 构建镜像

```shell

cd /home/zjf/datastore/opt/pptp/docker-pptp
docker build -t daemonzjf/pptp .
```

## 启动 pptp 服务

```shell
docker run -d -p 9090:9090 --link=oracle_ams:ams-db --name=pptp-ams daemonzjf/pptp
```


docker rm pptp-ams && docker rmi daemonzjf/pptp && docker build -t daemonzjf/pptp . && docker run -d -p 9090:9090 --link=oracle_ams:ams-db --name=pptp-ams daemonzjf/pptp
