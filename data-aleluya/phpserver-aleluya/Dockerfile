FROM alpine
# Environments
ENV TIMEZONE            America/Guatemala
ENV PHP_MEMORY_LIMIT    512M
ENV MAX_UPLOAD          50M
ENV PHP_MAX_FILE_UPLOAD 200
ENV PHP_MAX_POST        100M

# Thanks Jesus for https://github.com/matriphe/docker-alpine-php/blob/master/7.0/FPM/Dockerfile and others

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
	&& apk add --update \
		lighttpd \
    runit \
    php7-mcrypt \
		php7-soap \
		php7-openssl \
		php7-gmp \
		php7-pdo_odbc \
		php7-json \
		php7-dom \
		php7-pdo \
		php7-zip \
		php7-mysqli \
		php7-sqlite3 \
		php7-pdo_pgsql \
		php7-bcmath \
		php7-gd \
		php7-odbc \
		php7-pdo_mysql \
		php7-pdo_sqlite \
		php7-gettext \
		php7-xmlreader \
		php7-xmlrpc \
		php7-bz2 \
		php7-iconv \
		php7-pdo_dblib \
		php7-curl \
		php7-ctype \
    php7-fpm && \
	 rm -rf /var/cache/apk/*

#		runit@testing \
# set up folders, configure lighttpd and php-fpm
RUN mkdir -p /app/htdocs /app/error /etc/service/lighttpd /etc/service/php7-fpm \
	&& sed -i -E \
		-e 's/var\.basedir\s*=\s*".*"/var.basedir = "\/app"/' \
		-e 's/#\s+(include "mod_fastcgi_fpm.conf")/\1/' \
		-e 's/#\s+server.port\s+=\s+81/server.port = 5000/' \
		/etc/lighttpd/lighttpd.conf \
	&& sed -i -E \
		-e 's/user\s*=\s*nobody/user = lighttpd/' \
		/etc/php7/php-fpm.conf \
	&& touch /var/log/php7-fpm.log \
	&& chown -R lighttpd /var/log/php7-fpm.log \
	&& echo -e "#!/bin/sh\nlighttpd -D -f /etc/lighttpd/lighttpd.conf" > /etc/service/lighttpd/run \
	&& echo -e "#!/bin/sh\n/usr/sbin/php-fpm7 --nodaemonize" > /etc/service/php7-fpm/run \
	&& chmod -R +x /etc/service/* \
  && sed -i "s|;*daemonize\s*=\s*yes|daemonize = no|g" /etc/php7/php-fpm.conf && \
	sed -i "s|;*listen\s*=\s*127.0.0.1:9000|listen = 9000|g" /etc/php7/php-fpm.d/www.conf && \
	sed -i "s|;*listen\s*=\s*/||g" /etc/php7/php-fpm.d/www.conf && \
	sed -i "s|;*date.timezone =.*|date.timezone = ${TIMEZONE}|i" /etc/php7/php.ini && \
	sed -i "s|;*memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|i" /etc/php7/php.ini && \
    sed -i "s|;*upload_max_filesize =.*|upload_max_filesize = ${MAX_UPLOAD}|i" /etc/php7/php.ini && \
    sed -i "s|;*max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|i" /etc/php7/php.ini && \
    sed -i "s|;*post_max_size =.*|post_max_size = ${PHP_MAX_POST}|i" /etc/php7/php.ini && \
sed -i "s|;*cgi.fix_pathinfo=.*|cgi.fix_pathinfo= 0|i" /etc/php7/php.ini 

EXPOSE 5000

WORKDIR /app/htdocs

CMD /sbin/runsvdir -P /etc/service
