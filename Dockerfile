FROM ubuntu:18.04

RUN apt update&& \
apt install nginx --yes && \
apt install software-properties-common --yes && \
add-apt-repository ppa:ondrej/php && \
apt update && \
apt install php7.2 php7.2-fpm --yes  && \
apt install php7.2-mysql --yes

RUN pwd && ls -la
COPY . /var/www/html/unorganized-dashboard/dist/
RUN ls -la /var/www/html/unorganized-dashboard/dist

RUN cp /var/www/html/unorganized-dashboard/dist/default /etc/nginx/sites-available/default && \
cp /var/www/html/unorganized-dashboard/dist/www.conf /etc/php/7.2/fpm/pool.d/www.conf

EXPOSE 80
CMD ["/bin/bash", "-c", "service php7.2-fpm start && nginx -g \"daemon off;\""]
