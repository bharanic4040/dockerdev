
FROM ubuntu:14.04


MAINTAINER Bharani Chennu bchennu@cisco.com


RUN sudo apt-get update
RUN bash
RUN sudo apt-get install -y --fix-missing openjdk-7-jdk

RUN sudo apt-get install -y wget

RUN apt-get install -y git

RUN apt-get install -y dbus

RUN sudo wget www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/kepler/R/eclipse-jee-kepler-R-linux-gtk-x86_64.tar.gz -O eclipse.tar.gz

RUN mv eclipse.tar.gz /opt/

WORKDIR /opt

RUN sudo tar xvf eclipse.tar.gz

RUN sudo ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse

RUN export uid=1000 gid=1000
RUN mkdir -p /home/developer
RUN echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd
RUN echo "developer:x:${uid}:" >> /etc/group
RUN echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN chmod 0440 /etc/sudoers
RUN chown ${uid}:${gid} -R /home/developer


USER developer
ENV HOME /home/developer

RUN apt-get install -y firefox

RUN apt-get install -y maven


ENV M2_HOME /usr/share/maven
ENV M2 $M2_HOME/bin
ENV PATH $M2:$PATH

RUN sudo apt-get install -y mysql-server
RUN sudo apt-get install -y subversion
