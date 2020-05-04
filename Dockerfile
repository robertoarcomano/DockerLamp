# Dockerfile ubuntu example

# Create from ubuntu
FROM ubuntu:20.04

RUN env TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y openssh-server apache2 mysql-server php libapache2-mod-php php-mysql vim wordpress supervisor
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# DB Configuration
COPY db.sh /tmp
COPY wordpress.dump /tmp
COPY wordpress.tgz /tmp
RUN service mysql start && /tmp/db.sh

RUN rm -rf /var/www/html
# RUN ln -s /usr/share/wordpress /var/www/html
RUN tar zxvf /tmp/wordpress.tgz -C /var/www/
RUN ln -s /var/www/wordpress /var/www/html
RUN a2enmod rewrite
COPY htaccess /etc/wordpress/

EXPOSE 22
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
