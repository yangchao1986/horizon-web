#��/bin/bash
WORK_PATH='./web'
cd $WORK_PATH
echo '�����ļ�'
npm i --registry=https://registry.npm.taobao.org
npm run build
echo '��������'
docker build -t horizonsys/web:v1.0 . 
echo 'ɾ��������'
exist=`docker inspect --format '{{.State.Running}}' horizonsys-web`
if [ "$exist" ];
then
docker stop horizonsys-web
docker rm horizonsys-web
fi;
echo '����������'
#�������ʧ����docker run -dit --name=horizonsys-web -p 30080:80 horizonsys/web:v1.0 bash
docker run -di --name=horizonsys-web -p 30080:80 horizonsys/web:v1.0
echo '��������'
docker exec -it horizonsys-web bash
echo '��������'
