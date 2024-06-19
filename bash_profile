#
# ~/.bash_profile
#

if [ "$(tty)" = "/dev/tty1" ]; then
	startx
fi   
[[ -f ~/.bashrc ]] && . ~/.bashrc
export EDITOR=vim
export VISUAL=vim
