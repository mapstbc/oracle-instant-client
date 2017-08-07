FROM python:2.7.9
MAINTAINER safezpa safezpa<safezpa@gmail.com>

RUN mkdir -p /opt/oracle
RUN apt-get update
RUN apt-get install -y zip
COPY instantclient-basic-linux.x64-12.2.0.1.0.zip /opt/oracle/
RUN unzip /opt/oracle/instantclient-basic-linux.x64-12.2.0.1.0.zip -d /opt/oracle/
RUN cd /opt/oracle/instantclient_12_2
RUN ln -s libclntsh.so.12.1 libclntsh.so
RUN ln -s libocci.so.12.1 libocci.so
RUN apt-get install libaio1
RUN export LD_LIBRARY_PATH=/opt/oracle/instantclient_12_2:$LD_LIBRARY_PATH
RUN export PATH=/opt/oracle/instantclient_12_2:$PATH
RUN rm /opt/oracle/instantclient-basic-linux.x64-12.2.0.1.0.zip
WORKDIR /opt/oracle

