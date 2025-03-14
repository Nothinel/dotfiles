#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#if [ "$(tty)" = "/dev/tty1" ]; then
#	startx
#fi   

alias grep='grep --color=auto'



#Path Stuff
#
#Pythonverzeichniss einbinden
#PYTHONPATH="${PYTHONPATH}:/home/konrad/NextCloud/Dokumente/Python"
#export PYTHONPATH
#PATH=$PATH:~/scripts/Auswertungsscripte/
PATH=$PATH:~/scripts

# xbindkeys needs the scripts it wants to use to be in path before it is
# started, this should happen by restarting it every time a new execution of
# bashrc comes along (i.e. startup of new terminal window
killall -q xbindkeys 
xbindkeys

#
#BASH behavior
#
set -o vi
#alias ls='ls --color=auto'
alias ls='lsd'
shopt -s autocd
export EDITOR=vim
alias rps1='source ~/scripts/reset_ps1.sh'
alias hibernate='sudo systemctl hibernate'
#
#SHORTCUTS
alias showbrightness='cat /sys/class/backlight/amdgpu_bl1/brightness'
alias activate_larch='source ~/larch_env/bin/activate && source ~/scripts/reset_ps1.sh'
alias activate_easyxafs='source ~/easyxafs_env/bin/activate && source ~/scripts/reset_ps1.sh'
#
#Get these scripts from your scripts git into ~/scripts and be happy
alias nps='MakeNewPythonscript.sh'
alias nls='MakeNewLaTeXscript.sh'
alias nbs='MakeNewBashscript.sh'

eval "$(zoxide init --cmd cd bash)"

#Make the beginning of the terminal line look good and short
#PS1='[\u@\h \W]\n\$ '
#or beautiful with backgrounds and pointers, might need special font
#PS1='[┌\u@\h \W]\n└─\$ '
#PS1='[\u@\h \W]\n└─\$ '
seperator=$'\uE0B0' #arrow for cool factor
PROMPT_DIRTRIM=2
#PS1='\[\e[48;5;40m\]\[\e[30m\][\u@\h \W]\n\[\e[48;5;40m\]\[\e[30m\]└─\$\[\e[00m\]\[\e[38;5;40m\]'$seperator'\[\e[00m\]'
PS1='\[\e[48;5;34m\e[38;5;232m\]┌>'$VIRTUAL_ENV_PROMPT'>\u\[\e[48;5;18m\e[38;5;34m\]'$seperator'\[\e[38;5;34m\e[1m\]\h\[\e(B\e[m\e[48;5;34m\e[38;5;18m\]'$seperator'\[\e[48;5;34m\e[38;5;232m\]\w\[\e[48;2;0;0;0m\e[38;5;34m\]'$seperator'\n\[\e[48;5;34m\e[38;5;0m\]└─\$\[\e[48;5;232m\e[38;5;34m\]'$seperator'\[\e[48;2;0;0;0m\e[38;5;34m\]'
#\[ \] has to encapsulate any part that does not produce characters but only changes colors etc.
#\e[48;5;34m sets Background color in Ansi code (to some green in this case, try 46 for bright green, 232 for Black, 18 for blue)
#\e[48;5;<colorcode>m\] is the syntax for Background
#34 	green
#232 	black
#18 	blue
#1 		red
#\e[38;5;<colorcode>m\] is the syntax for Foreground
#\e[1m bold text on
#\e(B\e[m reset text properties
#\e[48;2;0;0;0m sets Background color for RGB values 0;0;0
