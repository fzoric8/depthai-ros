<------------Calibrating rgb ------------>
INTRINSIC CALIBRATION
Reprojection error of rgb: 1.7618346315082383
<------------Calibrating left ------------>
INTRINSIC CALIBRATION
Reprojection error of left: 0.20881487034986293
<------------Calibrating right ------------>
INTRINSIC CALIBRATION
Reprojection error of right: 0.17631936940366263
<-------------Extrinsics calibration of left and right ------------>
Reprojection error is 0.207457597784089
<-------------Epipolar error of left and right ------------>
Original intrinsics ....
L [[571.68977878   0.         626.12315328]
 [  0.         571.55491139 416.49232791]
 [  0.           0.           1.        ]]
R: [[571.54626887   0.         648.23449786]
 [  0.         571.36796771 416.08560957]
 [  0.           0.           1.        ]]
Intrinsics from the getOptimalNewCameraMatrix/Original ....
L: [[571.54626887   0.         648.23449786]
 [  0.         571.36796771 416.08560957]
 [  0.           0.           1.        ]]
R: [[571.54626887   0.         648.23449786]
 [  0.         571.36796771 416.08560957]
 [  0.           0.           1.        ]]
Average Epipolar Error is : 0.19607825532030934
Displaying Stereo Pair for visual inspection. Press the [ESC] key to exit.
<-------------Extrinsics calibration of right and rgb ------------>


Reprojection error is 0.2955006428583817
<-------------Epipolar error of right and rgb ------------>
Original intrinsics ....
L [[571.54626887   0.         648.23449786]
 [  0.         571.36796771 376.08560957]
 [  0.           0.           1.        ]]
R: [[770.2220301    0.         640.02161081]
 [  0.         769.68394817 354.06800423]
 [  0.           0.           1.        ]]
Intrinsics from the getOptimalNewCameraMatrix/Original ....
L: [[770.2220301    0.         640.02161081]
 [  0.         769.68394817 354.06800423]
 [  0.           0.           1.        ]]
R: [[770.2220301    0.         640.02161081]
 [  0.         769.68394817 354.06800423]
 [  0.           0.           1.        ]]
Average Epipolar Error is : 0.31048732863966805
Displaying Stereo Pair for visual inspection. Press the [ESC] key to exit.

Reprojection error threshold -> 3
rgb Reprojection Error: 1.761835
/root/depthai/calibrate.py:1029: DeprecationWarning: Conversion of an array with ndim > 0 to a scalar is deprecated, and will error in future. Ensure you extract a single element from your array before performing this operation. (Deprecated NumPy 1.25.)
  calibration_handler.setDistortionCoefficients(stringToCam[camera], cam_info['dist_coeff'])
Reprojection error threshold -> 1.1111111111111112
left Reprojection Error: 0.208815
/root/depthai/calibrate.py:1068: DeprecationWarning: Conversion of an array with ndim > 0 to a scalar is deprecated, and will error in future. Ensure you extract a single element from your array before performing this operation. (Deprecated NumPy 1.25.)
  calibration_handler.setCameraExtrinsics(stringToCam[camera], stringToCam[cam_info['extrinsics']['to_cam']], cam_info['extrinsics']['rotation_matrix'], cam_info['extrinsics']['translation'], specTranslation)
Reprojection error threshold -> 1.1111111111111112
right Reprojection Error: 0.176319
Flashing Calibration data into 
EEPROM VERSION being flashed is  -> 7
EEPROM VERSION being flashed is  -> 7

