# dockerdev
Docker GUI dev environment

Author - Bharani Chennu - bchennu@cisco.com

This dockerfile is to setup an automated development environment with GUI access.

The GUI docker containers can be run with the following command format.

sudo docker run \
           -it -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v `pwd`:/home/developer \
           bharanic404/dev
           
Run login-cont.sh directly with the command ./login-cont.sh <container-name>

do not use docker commands directly.
