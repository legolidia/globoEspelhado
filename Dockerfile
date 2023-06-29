FROM nginx:1.19-alpine

WORKDIR /etc/nginx
ENV http_proxy http://mackcloud:cloud2019@172.16.50.1:8080
ENV https_proxy http://mackcloud:cloud2019@172.16.50.1:8080

RUN rm /usr/share/nginx/html/index.html
COPY . /usr/share/nginx/html/

RUN mkdir /etc/nginx/ssl

COPY ./certificate/ssl-cert-snakeoil.key /etc/nginx/ssl
COPY ./certificate/ssl-cert-snakeoil.pem /etc/nginx/ssl
COPY ./certificate/nginx.conf /etc/nginx/conf.d
RUN rm /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]