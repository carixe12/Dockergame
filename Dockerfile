FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >>/etc/nginx/nginx.conf
RUN curl -L -o /var/www/html/master.zip https://github.com/gabrielecirulli/2048/archive/master.zip
RUN cd /var/www/html/ && unzip -j master.zip && rm master.zip

EXPOSE 60

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
