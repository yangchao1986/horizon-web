#！/bin/bash
WORK_PATH='./web'
cd $WORK_PATH
echo '编译文件'
npm i --registry=https://registry.npm.taobao.org
npm run build
echo '创建镜像'
docker build -t horizonsys/web:v1.0 . 
echo '删除旧容器'
exist=`docker inspect --format '{{.State.Running}}' horizonsys-web`
if [ "$exist" ];
then
docker stop horizonsys-web
docker rm horizonsys-web
fi;
echo '创建新容器'
docker run -di --name=horizonsys-web -p 30080:80 horizonsys/web:v1.0
