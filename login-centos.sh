IMAGE_NAME=bharanic404/centos

DOCKER_COMMAND="sudo docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -it -v `pwd`:/home/developer --name "
CONTAINER=$1

EXEC_COMMAND="sudo docker exec -it $CONTAINER bash"
LAUNCH_COMMAND="$DOCKER_COMMAND$CONTAINER $IMAGE_NAME"
START_COMMAND="sudo docker start $CONTAINER"

RUNNING=$(sudo docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

if [ $? -eq 1 ]; then
  echo "UNKNOWN - $CONTAINER does not exist."
  $LAUNCH_COMMAND
  exit 0
fi


if [ "$RUNNING" == "false" ]; then
  echo "CRITICAL - $CONTAINER is not running."
  $START_COMMAND
  $EXEC_COMMAND
  exit 0
fi
$EXEC_COMMAND
exit 0
