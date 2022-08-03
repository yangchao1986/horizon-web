#下载
git clone git@github.com:yangchao1986/horizon-web.git

#修改default.conf参数
location /api/ {        
        proxy_pass http://ip地址:端口/;
}

#运行脚本
. run.sh