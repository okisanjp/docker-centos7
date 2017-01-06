FROM centos:7
MAINTAINER okisanjp

# yum update
RUN yum -y update
RUN yum clean all

# localize
RUN yum -y reinstall glibc-common
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

# install man
RUN yum -y --setopt=tsflags='' install man-pages man-pages-ja

# install vim
RUN yum -y install vim-enhanced
