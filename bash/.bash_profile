# history
export HISTTIMEFORMAT="%d/%m/%y %T "

# GCC color
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# wakatime
source ~/workspace/bash-wakatime/bash-wakatime.sh

# Local Python env
source ~/py2/bin/activate
#source ~/py3/bin/activate

#ROS parameters
source ~/ros_ws/devel/setup.bash
export PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/dist-packages

export ROS_HOSTNAME=localhost
export ROS_MASTER_URI=http://localhost:11311
# export ROS_HOSTNAME=192.168.3.101
# export ROS_IP=192.168.3.101
# export ROS_MASTER_URI=http://192.168.3.4:11311
# for indigo
# source ~/catkin_ws/devel/setup.bash
#source /usr/share/gazebo/setup.sh
#export AUV_IPADDRESS=127.0.0.1
#export SBC_IPADDRESS=127.0.0.1
#export AUV_PORT=4450

#Gazebo
source /usr/share/gazebo/setup.sh

# for ddp
DDP_DIR=~/ros_ws/src/ddp/map_arena/visualization
GZ_HOME=~/.gazebo
export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}${GZ_HOME}:$DDP_DIR/models
export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}${GZ_HOME}:$(roscd;pwd)/lib
export GAZEBO_RESOURCE_PATH=${GAZEBO_RESOURCE_PATH}${GZ_HOME}:$DDP_DIR/models

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

# Android Studio
export PATH=$PATH:$HOME/local/android-studio/bin
export PATH=$PATH:$HOME/local/Android

#Vmail
#export VMAIL_HTML_PART_READER='elinks -dump'

#Junit test
#export JUNIT_HOME=/usr/local/junit
#export CLASSPATH=$CLASSPATH:$JUNIT_HOME/junit4.10.jar:.

#Europa
#export EUROPA_HOME=~/programs/europa
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$EUROPA_HOME/lib      # DYLD_LIBRARY_PATH on a Mac

#Antlr3
#export CLASSPATH=".:/usr/local/lib/antlr-4.2-complete.jar:$CLASSPATH"

#JAVA
export JAVA_HOME=/usr/local/java/jdk1.8.0_111
export JRE_HOME=/usr/local/java/jre1.8.0_111
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin

#LD_PATH error remover
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib

#CUDA custom path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export PATH=$PATH:/usr/local/cuda/bin
#export LD_LIBRARY_PATH=$HOME/local/opencv3:$LD_LIBRARY_PATH

# Boost custom path
#export PATH=$PATH:~/local/boost_1_46_0/lib
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/local/boost_1_55_0/libs:~/local/boost_1_46_0/libs

# wrapper.py
eval "$(register-python-argcomplete wrapper.py)"

export TLMHOST=@license.iitb.ac.in
export TECHOME=/usr/local/tecplot

# npm
export PATH=~/.npm-global/bin:$PATH

# grails
# source $HOME/.sdkman/bin/sdkman-init.sh
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "SDKMAN_DIR/.sdkman/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
