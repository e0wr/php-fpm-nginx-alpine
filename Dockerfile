FROM alpine:latest

RUN apk --update --no-cache add curl ca-certificates nginx
RUN apk add php7 php7-xml php7-exif php7-fpm php7-session php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-phar php7-fileinfo php7-mbstring php7-tokenizer php7-simplexml
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh


CMD ["/bin/ash", "/entrypoint.sh"]
