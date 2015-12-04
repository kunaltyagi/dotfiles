#ROS parameters
export ROS_HOSTNAME=localhost
export ROS_MASTER_URI=http://localhost:11311
source ~/catkin_ws/devel/setup.bash
#source /usr/share/gazebo/setup.sh

#Gazebo
source /usr/share/gazebo-5.1/setup.sh
SIM_DIR=`rospack find auv_simulator`
export GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:$SIM_DIR
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$SIM_DIR/visualization/gazebo/models
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:~/catkin_ws/devel/lib

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Vmail
export VMAIL_HTML_PART_READER='elinks -dump'

#Junit test
export JUNIT_HOME=/usr/local/junit
export CLASSPATH=$CLASSPATH:$JUNIT_HOME/junit4.10.jar:.

#Europa
export EUROPA_HOME=~/programs/europa
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$EUROPA_HOME/lib      # DYLD_LIBRARY_PATH on a Mac

#Antlr3
export CLASSPATH=".:/usr/local/lib/antlr-4.2-complete.jar:$CLASSPATH"

#JAVA
export JAVA_HOME=/usr/local/java/jdk1.8.0_11
export JRE_HOME=/usr/local/java/jre1.8.0_11
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin

#LD_PATH error remover
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib:~/local/boost_1_55_0/libs:~/local/boost_1_46_0/libs


# Boost custom path
export PATH=$PATH:~/local/boost_1_46_0/lib

# wrapper.py
`eval "$(register-python-argcomplete wrapper.py)"`
