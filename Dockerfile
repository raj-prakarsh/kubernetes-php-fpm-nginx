FROM ubuntu:18.04

RUN apt update&& \
apt install nginx --yes && \
apt install software-properties-common --yes && \
add-apt-repository ppa:ondrej/php && \
apt update && \
apt install php7.2 php7.2-fpm --yes  && \
apt install php7.2-mysql --yes

RUN pwd && ls -la
COPY . /var/www/html
RUN ls -la /var/www/html

EXPOSE 80
CMD ["/bin/bash", "-c", "service php7.2-fpm start && nginx -g \"daemon off;\""]
