# Depthai ROS Repository
Hi and welcome to the main depthai-ros respository! Here you can find ROS related code for OAK cameras from Luxonis. Don't have one? You can get them [here!](https://shop.luxonis.com/)

You can find the newest documentation [here](https://docs-beta.luxonis.com/software/ros/depthai-ros/intro/)


# PoE camera

In order to enable PoE camera, set your network where camera is connected on following: 

```
169.254.x.y      255.255.0.0     169.254.x.1
```

Camera has IP of `169.254.1.222`. 

You can run following to test camera: 

```
depthai-viewer
```

Camera should be detected and started!
