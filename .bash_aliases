catkin_make_new()
{
    x=$PWD;
    roscd;
    cd ..;
    catkin_make "$@";
    cd $x;
}

alias sublime_text="~/programs/Sublime\ Text\ 2/sublime_text"
alias arduino="~/programs/arduino-0023/arduino"
alias terminator="terminator -l Coding"
alias ps="ps aux"
alias resource="source ~/.bashrc"
alias cm="catkin_make_new"
alias screensaver='gconftool-2 --type bool --set /apps/gnome-screensaver/idle_activation_enabled "false"'
alias fortunecow='fortune|cowsay'
alias windows='sudo mount -t ntfs-3g -o ro /dev/sda3/ /media/Alien\ OS/'
alias bcd='cd ~/.bin/.bin'
alias matsya="terminator -l ros -p sun"
