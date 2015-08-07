FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get clean
# ------------------------------------------------------------------------------
# Install Java 8
# http://askubuntu.com/questions/536134/install-specific-java-version-for-12-04/536161#536161
# ------------------------------------------------------------------------------
RUN mkdir /opt/jdk
WORKDIR /opt
RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u5-b13/jdk-8u5-linux-x64.tar.gz
RUN tar -zxf jdk-8u5-linux-x64.tar.gz -C /opt/jdk
RUN update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_05/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_05/bin/javac 100

RUN rm /opt/jdk-8u5-linux-x64.tar.gz
