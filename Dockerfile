FROM nginx:latest
COPY /home/horizon-web/dist/ /usr/share/nginx/html/
COPY nginx/default.conf /etc/nginx/conf.d/default.conf