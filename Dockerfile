FROM centos:centos6
MAINTAINER ken morishita <k_morishita@yumemi.co.jp>

RUN yum install -y tar openssl-devel gcc git java-1.7.0-openjdk-devel sqlite-devel gcc-c++
RUN mkdir -p /application

ADD setup_ruby.sh /application/setup_ruby.sh
RUN sh /application/setup_ruby.sh

ADD setup_supervisord.sh /application/setup_supervisord.sh
RUN sh /application/setup_supervisord.sh

ADD setup_smcwebservice.sh /application/setup_smcwebservice.sh
RUN sh /application/setup_smcwebservice.sh

ADD setup_webui.sh /application/setup_webui.sh
RUN sh /application/setup_webui.sh
