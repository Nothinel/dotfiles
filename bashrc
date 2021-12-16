#Make the beginning of the terminal line look good and short
#PS1='[\u@\h \W]\n\$ '
#or beautiful with backgrounds and pointers, might need special font
#PS1='[┌\u@\h \W]\n└─\$ '
#PS1='[\u@\h \W]\n└─\$ '
seperator=$'\uE0B0' #arrow for cool factor
PS1='\[\e[48;5;40m\]\[\e[30m\]┌ \u@\h \W\[\e[00m\]\n\[\e[48;5;40m\]\[\e[30m\]└─\$\[\e[00m\]\[\e[38;5;40m\]'$seperator'\[\e[00m\]\[\e[48;5;00m\]'
#\[\e[48;5;40m\] sets Background color (to some green in this case, try 46 for bright green)
#\[\e[30m\] sets Text color (to black in this case)
#\[\e[38;5;40m\] sets Text color (to green in this case) mainly to color the seperator
#\[\e[00m\] resets color choices


#Path Stuff
#
#Pythonverzeichniss einbinden
#PYTHONPATH="${PYTHONPATH}:/home/kr80cora/NextCloud/Dokumente/Python"
#PATH=$PATH:~/scripts/Auswertungsscripte/
PATH=$PATH:~/scripts
export PYTHONPATH

#
#BASH behavior
#
set -o vi
alias ls='lsd'
shopt -s autocd
export EDITOR=vim
#
#SHORTCUTS
#
#Get these scripts from your scripts git into ~/scripts and be happy
alias nps='MakeNewPythonscript.sh'
alias nls='MakeNewLaTeXscript.sh'
alias nbs='MakeNewBashscript.sh'
