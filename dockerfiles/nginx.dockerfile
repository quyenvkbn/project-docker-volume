# OS alpine 3.13
FROM nginx:1.19.8-alpine

LABEL maintainer="Nguyen Quyen <nguyenquyen18011996@gmail.com>"

# alpine & nginx version
RUN cat /etc/os-release | grep PRETTY_NAME && nginx -v

ARG TZ=UTC

ENV TZ=$TZ \
	COMPOSER_ALLOW_SUPERUSER=1

RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && date

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/site/ /etc/nginx/sites-enabled

WORKDIR /var/www/html

EXPOSE 80 81 82 443

COPY nginx/start /command/start

ENTRYPOINT ["/command/start"]
