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

# Docs

* [depth accuracy](https://docs.luxonis.com/hardware/platform/depth/depth-accuracy/#Depth%20Accuracy-Measurement%20setup)
* [calibration](https://docs.luxonis.com/hardware/platform/depth/calibration/)

## Calibration command 

To calibrate choose corect checker board and run following: 
```
python3 calibrate.py -s 5.6 --board OAK-D-PRO-W-POE -nx 15 -ny 8
```
## Note: 

Due to change in the logic of the repository and in the way we build, 
`Dockerfile.noetic` is on the `humble` branch. 

And it is buildable by calling: 

```
docker build -t depthai_img:noetic -f Dockerfile.noetic .
```

# TODO: 

- [ ] [humble] Enable rviz in camera docker 
- [ ] Calibrate OAK-D-Pro 
- [ ] Compare both cameras
- [ ] [noetic] Added Dockerfile.noetic on humble branch
