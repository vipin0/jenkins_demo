FROM alpine:3.14


WORKDIR /var/www/localhost/htdocs

RUN apk update \
    && apk add apache2 php7 php7-mysqlnd \
    php7-mbstring php7-opcache php7-gd php7-fpm php7-apache2 \
    vim

COPY . .

EXPOSE 80/tcp

CMD [ "httpd","-D","FOREGROUND"]