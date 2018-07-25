FROM centos:6
MAINTAINER Sonny Ramos <sonnysidramos@gmail.com>

RUN yum -y install epel-release
RUN yum -y install wget
RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN wget https://centos6.iuscommunity.org/ius-release.rpm
RUN rpm -Uvh ius-release*.rpm
RUN yum -y update

# Installing memcache
RUN yum -y install php56u-fpm php56u php56u-opcache php56u-xml php56u-mcrypt php56u-gd php56u-devel php56u-mysql php56u-intl php56u-mbstring php56u-bcmath php56u-pecl-memcache php56u-pecl-memcached

# Installing mysql
RUN yum -y install mysql-server mysql-client

# Installing nginx 
RUN yum -y install nginx

# Installing pip 
RUN yum install -y python-setuptools
RUN easy_install pip

# Installing supervisord
pip install supervisor

# Installing other utilities
RUN yum -y install git software-properties-common zip unzip

# Other configs / timezone, short tags, etc
COPY settings/php.d /etc/php.d
