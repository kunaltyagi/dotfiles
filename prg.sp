[$sources]
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo sh -c 'echo "deb
http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release
-cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
[$keys]
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo
apt-key add -

[apt-add-repository]
ppa:ubuntu-toolchain-r/test
ppa:xqms/opencv-nonfree
ppa:tualatrix/ppa

[apt-get install]
vim
guake
terminator
git
mercurial
build-essential
gcc-5
g++-5
linuxdcpp
tree
libgl1-mesa-dev-lts-wily
ros-indigo-desktop-full
ros-indigo-rospack
shutter
ubuntu-tweak
htop

[pip install]
rosinstall
argcomplete

[$setup]
sudo rosdep init
rosdep update

[$software center]
emacs gparted vlc wesnoth filezilla

[$deb]
chrome sublime-text
