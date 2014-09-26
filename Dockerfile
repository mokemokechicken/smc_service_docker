FROM centos:centos6
MAINTAINER Ken Morishita <k_morishita@yumemi.co.jp>

RUN yum install -y tar openssl-devel gcc git java-1.7.0-openjdk-devel sqlite-devel gcc-c++ readline-devel flex graphviz-devel

ADD setup_supervisord.sh /application/setup_supervisord.sh
RUN sh /application/setup_supervisord.sh

### setup sshd
ADD setup_sshd.sh /application/setup_sshd.sh
RUN sh /application/setup_sshd.sh

### Install Application

RUN mkdir -p /application

# ruby
ADD setup_ruby.sh /application/setup_ruby.sh
RUN sh /application/setup_ruby.sh

# smc
ADD setup_smcwebservice.sh /application/setup_smcwebservice.sh
RUN sh /application/setup_smcwebservice.sh

# rails
ADD setup_webui.sh /application/setup_webui.sh
RUN sh /application/setup_webui.sh

ADD update_webui.sh /application/update_webui.sh

EXPOSE 8000
EXPOSE 9000

# init script
ADD init.sh /application/init.sh
RUN chmod +x /application/init.sh
CMD /application/init.sh
