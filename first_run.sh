docker run --privileged -v /dev/bus/usb:/dev/bus/usb --device-cgroup-rule='c 189:* rmw' -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --network host -i --name depthai_cont2 depthai_img:latest
