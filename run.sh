#! /bin/bash  
ray_count=$1  
catkin_make  
source devel/setup.sh  
if [ "$ray_count" == '16' ]; then  
    roslaunch aloam_velodyne aloam_velodyne_VLP_16.launch  
elif [ "$ray_count" == '32' ]; then  
    roslaunch aloam_velodyne aloam_velodyne_HDL_32.launch  
elif [ "$ray_count" == '64' ]; then  
    roslaunch aloam_velodyne aloam_velodyne_HDL_64.launch  
else  
    roslaunch aloam_velodyne aloam_mulran.launch  
fi  
#conda activate g_loam
python ./src/lidar_slam_rec/utils/python/makeMergedMap.py
echo "done"
