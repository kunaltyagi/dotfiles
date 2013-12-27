export PROMPT_DIRTRIM=3

# Colors
Black="$(tput setaf 0)"
BlackBG="$(tput setab 0)"
DarkGrey="$(tput bold ; tput setaf 0)"
LightGrey="$(tput setaf 7)"
LightGreyBG="$(tput setab 7)"
White="$(tput bold ; tput setaf 7)"
Red="$(tput setaf 1)"
RedBG="$(tput setab 1)"
LightRed="$(tput bold ; tput setaf 1)"
Green="$(tput setaf 2)"
GreenBG="$(tput setab 2)"
LightGreen="$(tput bold ; tput setaf 2)"
Brown="$(tput setaf 3)"
BrownBG="$(tput setab 3)"
Yellow="$(tput bold ; tput setaf 3)"
Blue="$(tput setaf 4)"
BlueBG="$(tput setab 4)"
LightBlue="$(tput bold ; tput setaf 4)"
Purple="$(tput setaf 5)"
PurpleBG="$(tput setab 5)"
Pink="$(tput bold ; tput setaf 5)"
Cyan="$(tput setaf 6)"
CyanBG="$(tput setab 6)"
LightCyan="$(tput bold ; tput setaf 6)"
Reset="$(tput sgr0)"
Reverse="$(tput rev)"
# No Color

#PS1 for git
#export PS1='\u@\h:\w:$(__git_ps1 "[%s]")\$ '
#a fancier one
export PS1="\[$Reset$Brown\]\u\[$Reset$Green\]@\[$Reset$Blue\]\h:\[$Reset$Purple\]\w\[$Reset$LightGrey\][\d \t]\[$Reset\]\n\[$Reset$LightRed\]\$(__git_ps1 '[%s]')\`if [ \$? -eq 0 ]; then echo \[$Green\]':)' ; else echo \[$Red\]':('; fi\`\[$Reset\]$ "

#PS2 (in long terminal statements, after pressing /)
export PS2="--> "

#PS3 (in select statements in shell scripts)
export PS3="#? "

#PS4 (for set -x in shell scripts, prefixing trace outout, debugging mode)
export PS4='$0+$LINENO:'
