# Nginx反向代理
## 获取 Nginx 镜像

``` bash
docker pull nginx
```
## 下载配置文件
``` bash
wget https://raw.githubusercontent.com/Daemon007/docker/master/Nginx/leanote.conf
wget https://raw.githubusercontent.com/Daemon007/docker/master/Nginx/nginx.conf
wget https://raw.githubusercontent.com/Daemon007/docker/master/Nginx/run.sh
```

## 创建工作目录

``` bash
mkdir /root/docker/nginx
mkdir /root/docker/nginx/nginx-cache

cp leanote.conf nginx.conf run.sh /root/docker/nginx
```
## 启动 Nginx 服务

``` bash
chmod +x run.sh
./run.sh
```
