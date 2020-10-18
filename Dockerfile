FROM nginx:1.19.3-alpine
EXPOSE 80
MAINTAINER orginux
RUN rm /etc/nginx/conf.d/*
COPY nginx/index.html /usr/share/nginx/html/index.html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
