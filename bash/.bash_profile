#ROS parameters
export ROS_HOSTNAME=localhost
export ROS_MASTER_URI=http://localhost:11311
source ~/catkin_ws/devel/setup.bash
source /usr/share/gazebo/setup.sh

#Gazebo
export GAZEBO_RESOURCE_PATH=~/catkin_ws/src/robosub/matsya_gazebo/worlds:$GAZEBO_RESOURCE_PATH
export GAZEBO_MODEL_PATH=~/catkin_ws/src/robosub/matsya_gazebo/models:$GAZEBO_MODEL_PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Vmail
export VMAIL_HTML_PART_READER='elinks -dump'

#Junit test
export JUNIT_HOME=/usr/local/junit
export CLASSPATH=$CLASSPATH:$JUNIT_HOME/junit4.10.jar:.

#Europa
export EUROPA_HOME=~/programs/europa
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$EUROPA_HOME/lib      # DYLD_LIBRARY_PATH on a Mac

#Antlr3
export CLASSPATH=".:/usr/local/lib/antlr-4.2-complete.jar:$CLASSPATH"

#JAVA
export JAVA_HOME=/usr/local/java/jdk1.8.0_05
export JRE_HOME=/usr/local/java/jre1.8.0_05
export PATH=$PATH:$HOME/bin:$JRE_HOME/bin
