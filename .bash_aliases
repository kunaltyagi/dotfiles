catkin_make_new()
{
    x=$PWD;
    roscd;
    cd ..;
    catkin_make "$@";
    cd $x;
}
cdl()
{
    cd $@;
    clear;
    l;
}
alias localip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
wificonnect()
{
    while true; do
        x=$(ifconfig wlan0 | grep 'inet addr' | grep -o -E "10.[0-9]+.[0-9]+.[0-9]+" | grep -v 255)
#         ip=$(ifconfig wlan0 | grep 'inet addr' | grep -o -E "[0-9]+.[0-9]+.[0-9]+.[0-9]+" | grep -v 255)
        ip=$(localip)
        echo "My ip is $ip"
        if [ +$x = "+" ]; then
            echo " Releasing DHCP and reacquiring"
            sudo dhclient -r wlan0;
            sudo dhclient wlan0;
        else
            echo "Yay, internet prevails"
            break
        fi
    done
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
alias ros="terminator -l ros"
alias cdl="cdl"
alias cl="clear; l"
alias view_installed="dpkg --list | awk '{print $2}' | tail -n +6"
alias utar="tar -zxvf"
alias check_temp="sudo sensors ; sudo hddtemp /dev/sda"
