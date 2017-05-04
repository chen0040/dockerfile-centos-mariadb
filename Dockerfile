FROM centos/systemd

MAINTAINER Xianshun Chen <support@database.com>
LABEL Vendor="Xianshun Chen"
LABEL Version=1.0.0

LABEL Build docker build --rm --tag database/mariadb .

RUN yum -y update && yum clean all
RUN yum -y install --setopt=tsflags=nodocs epel-release

RUN yum -y install bind-utils pwgen psmisc hostname
RUN yum -y install mariadb*

# Place VOLUME statement below all changes to /var/lib/mysql
VOLUME /var/lib/mysql

RUN useradd -ms /bin/bash xschen

COPY sbin/start.sh /home/xschen/start.sh
RUN chmod +x /home/xschen/start.sh

COPY sbin/stop.sh /home/xschen/stop.sh
RUN chmod +x /home/xschen/stop.sh

USER xschen
WORKDIR /home/xschen

COPY conf/my.cnf /etc/my.cnf
COPY conf/mysql-init.sql /home/xschen

EXPOSE 3306

ENTRYPOINT ["/home/xschen/start.sh"]



