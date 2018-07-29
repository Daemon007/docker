#! /bin/bash
docker rm -f nginx-leanote
docker run -d -v /root/docker/nginx/nginx.conf:/etc/nginx/nginx.conf -v /root/docker/nginx/nginx-cache:/var/cache/nginx -v /root/docker/nginx/leanote.conf:/etc/nginx/conf.d/default.conf --net=host --name=nginx-leanote --restart=always nginx
