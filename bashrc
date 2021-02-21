#Make the beginning of the terminal line look good and short
PS1='[\u@\h \W]\$ '

#
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

#
#SHORTCUTS
#
#Get these scripts from your scripts git into ~/scripts and be happy
alias nps='MakeNewPythonscript.sh'
alias nls='MakeNewLaTeXscript.sh'
alias nbs='MakeNewBashscript.sh'
