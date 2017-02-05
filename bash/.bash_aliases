#! /bin/bash

catkin_make_new()
{
    x=$PWD;
    roscd;
    cd ..;
    filename='/home/'$(whoami)'/local/error_log.txt';
    catkin_make "$@" 2> $filename;
    cd $x;
    if [ `wc -l $filename | awk '{ print $1 }'` -ne 0 ]; then less $filename; else \rm $filename; fi;
}
cdl()
{
    cd $@;
    clear;
    l;
}
function cd()
{
    builtin cd $@
    PATH=${PATH%:*}:$PWD
}
function define
{
    # espeak for the pronunciation audible output and phonetic alphabet string
    echo "Phoneme mnemonics: $(espeak -ven-uk-rp -x -s 120 "$1" 2> /dev/null)"
    # dict - the client for the dictionary server
    dict "$1"       
}
notify_new()
{
#    $@ && notify-send -i face-smile "Done. And a success" || notify-send -i face-embarrassed "Oops. Was it supposed to happen??";
     notify-send -i face-smile "Done. And a success" || notify-send -i face-embarrassed "Oops. Was it supposed to happen??";
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
study_mode()
{
    x=$@;
    cd ~/workspace/studies;
    if [ $x ]; then cd $x; fi;
}

# SSH auto-completion based on entries in known_hosts.
if [[ -e ~/.ssh/known_hosts ]]; then
    complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh scp sftp
fi

ssh_cd()
{
t="${!#}"   #store the args to the command
com=("ssh" "-t" "${@:1:$(($#-1))}" "${t%:*}" "cd ${t##*:}; \$SHELL -l")
"${com[@]}"
}

# alias to rotate the screen
alias rotate="xrandr --output eDP1 --rotate $@"  # normal, inverted, right, left

# alias rm="rmtrash"
# alias rm="rm -i"
# alias mv="mv -i"
# alias cp="cp -i"

# alias fuck='sudo $(history -p \!\!)' #F this S***, am going sudo
eval $(thefuck --alias)
eval "$(hub alias -s)"
hub_bash=~/workspace/open_source/hub/etc/hub.bash_completion.sh
if [ -f $hub_bash ]; then
    . $hub_bash
fi

alias tecplot="/usr/local/tecplot/bin/tecplot"
alias ]='xdg-open $@'
alias tags_generate="ctags-exuberant -R ."
alias internet='python2 ~/workspace/dotfiles/python/iitblogin.py'
# alias sublime_text="~/programs/Sublime\ Text\ 2/sublime_text & > /dev/null"
alias error_code="shuf -i 0-99999999 -n 1"
alias arduino="~/programs/arduino-0023/arduino"
alias ps="ps aux"
alias resource="source ~/.bashrc"
alias cm="catkin_make_new"
alias screensaver='gconftool-2 --type bool --set /apps/gnome-screensaver/idle_activation_enabled "false"'
alias fortunecow='fortune|cowsay'
alias windows='sudo mount -t ntfs-3g -o ro /dev/sda5/ /media/kunal/OS_sudo/'
alias win_share='sudo mount -t ntfs-3g -o ro /dev/sda7/ /media/kunal/Share_sudo/'
alias bcd='cd ~/.bin/.bin'
alias matsya="terminator -l ros -p sun"
alias ros="terminator -l ros"
alias cl="clear; l"
alias view_installed="dpkg --list | awk '{print $2}' | tail -n +6"
alias utar="tar -zxvf $@"
alias check_temp="sudo sensors ; sudo hddtemp /dev/sda"
alias kz="kill %%"
alias random_alpha="apg"
alias shortcut="sudo ln -s $@"
alias matlab="/usr/local/MATLAB/R2016b/bin/matlab"
alias temperature="sensors|tail -n +3|head -n 1|awk '{print $4}'|grep -o -E [0-9]+\.[0-9]+|head -n 1"
alias study="study_mode"
alias delete="trash-rm"
alias list_disks="lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL" #run as sudo
alias where_am_i="echo "$(tput setaf 2)$(whoami)$(tput setaf 0)@$(tput setaf 3)$(hostname)$(tput setaf 0):$(tput setaf 6)$(pwd)$(tput sgr0)" "
alias sshcd="ssh_cd"
alias to_pdf="soffice --invisible --nologo -convert-to pdf $@" #give filename as parameter, should be openable by libreoffice :P
alias copy_to_buffer="xclip -sel clip < $@"
alias start_HTTP_server="python -m SimpleHTTPServer"
alias suspend="dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend"
alias notify="notify_new"
alias antlr4='java -jar /usr/local/lib/antlr-4.2-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'
alias gre='grep -nHT --color $@'
alias py='python'
alias py2='source ~/py2/bin/activate; python2'
alias py3='source ~/py3/bin/activate; python3'
alias ipy='ipython notebook --pylab=inline'
alias iso_mount='sudo mount -t iso9660 -o ro $@ /media/iso'
alias pathogen_install="mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim"
alias copy='xclip -selection clipboard'
alias clint='python /home/kunaltyagi/catkin_ws/src/robosub/auv_utils/src/lint/cpp/cpplint.py $@'
alias filesize="stat -f '%z bytes'"
alias mendeley='~/local/mendeley/bin/mendeleydesktop'
alias robosync='x=$PWD; roscd robosub; git fetch origin; cd $x'
alias em='emacs -nw'

azsdcd_tmp_errorProne()
{
#    temperature_current[]  0: pci_adapter, 1: physical, 2: hdd, 3...6: core
#    temperature_high[]     similar scheme
#    temperature_critical[]     similar scheme
    temperature_current[0]=$(sensors | grep high | head -n 1 | awk '{print $2}' | grep -o -E "[0-9]+\.*[0-9]*")
    temperature_high[0]=$(sensors | grep high | head -n 1 | awk '{print $5}' | grep -o -E "[0-9]+\.*[0-9]*")
    temperature_critical[0]=$(sensors | grep high | head -n 1 | awk '{print $8}' | grep -o -E "[0-9]+\.*[0-9]*")

    temperature_current[1]=$(sensors | grep high | tail -n +2 | head -n 1 | awk '{print $4}' | grep -o -E "[0-9]+\.*[0-9]*")
    temperature_high[1]=$(sensors | grep high | tail -n +2 | head -n 1 | awk '{print $7}' | grep -o -E "[0-9]+\.*[0-9]*")
    temperature_critical[1]=$(sensors | grep high | tail -n +2 | head -n 1 | awk '{print $10}' | grep -o -E "[0-9]+\.*[0-9]*")

    temperature_current[2]=$(sudo hddtemp /dev/sda | awk '{print $3}' | grep -o -E "[0-9]+\.*[0-9]*");
    temperature_high[2]=0;
    temperature_critical[2]=0;

    for i in `seq 3 6`; do
        temperature_current[$i]=$(sensors | grep high | tail -n +$i | head -n 1 | awk '{print $3}' | grep -o -E "[0-9]+\.*[0-9]*")
        temperature_high[$i]=$(sensors | grep high | tail -n +$i | head -n 1 | awk '{print $6}' | grep -o -E "[0-9]+\.*[0-9]*")
        temperature_critical[$i]=$(sensors | grep high | tail -n +$i | head -n 1 | awk '{print $9}' | grep -o -E "[0-9]+\.*[0-9]*")
    done

    for i in `seq 0 6`; do
        if [ ${temperature_critical[$i]} -gt 0 ]; then
            if [ ${temperature_current[$i]} -gt $( ${temperature_high[$i]}/2 + ${temperature_critical[$i]}/2 )]; then
                zenity --question --text "High temperatures detected. Suspend?"
                ans=$?
                if [ ans -eq 0 ]; then
                    zenity --info --text "System will suspend now!"
                    sudo suspend
                else
                    zenity --info --text "Syatem may shut down anytime now, unless lower core temperatures are achieved"
                fi
            fi
            if [ $( ${temperature_current[$i]} + 2 ) -gt ${temperature_critical[$i]} ]; then
                zenity --error --text "System suspending due to thermal issues"
                sudo suspend
            fi
        fi
    done

}
flash()
{
    while true;
        do printf \\e[?5h; sleep 0.1; printf \\e[?5l; read -s -n1 -t1 && break;
    done;
}
