
FROM ubuntu:14.04
RUN sudo apt-get update
RUN bash
RUN sudo apt-get install -y --fix-missing openjdk-7-jdk

RUN sudo apt-get install -y wget

RUN apt-get install -y git

RUN apt-get install -y dbus

ADD eclipse-jee-kepler-SR2-linux-gtk-x86_64.tar.gz /opt/
RUN ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse

# Replace 0 with your user / group id
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

