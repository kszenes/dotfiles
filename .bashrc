#Gaussiain path variable
export GAUSS_EXEDIR="/Applications/gaussian09/g09"
set -o vi

# ANSI Colors
Reset='\033[0m'
Black='\033[0;30'
Red='\033[0;31m'
Green='\033[0;32m'
Brown_Orange='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
Light_Gray='\033[0;37m'
Dark_Gray='\033[1;30m'
Light_Red='\033[1;31m'
Light_Green='\033[1;32m'
Yellow='\033[1;33m'
Light_Blue='\033[1;34m'
Light_Purple='\033[1;35m'
Light_Cyan='\033[1;36m'
White='\033[1;37m'

Bold_Magenta='\u001b[35;1m'

Blue_Bg='\e[44m'

#Color customization
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LS_COLORS=dircolors
export PS1="\[${Light_Red}\][\[${Light_Green}\]\u@\h\[${Light_Red}\]] \[${Light_Cyan}\]\W\[${Light_Green}\] $ \[${Reset}\]"

#Change prompt and output color
#preexec() { 
#    tput setaf 055
#    :
#}
#preexec_invoke_exec() {
#    [ -n "$COMP_LINE" ] && return
#    local this_command=`HISTTIMEFORMATE= history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//"`;
#    preexec "$this_command"
#}
#trap 'preexec_invoke_exec' DEBUG


#Set Python3/Pip3 to be called for Python/Pip
alias python=python3
alias pip=pip3
alias jupyter="python3 -m notebook --no-browser"

#Prints profile being loaded
printf "${Light_Blue}Settings from BASHRC\n"

#Colors for files in Terminal
printf "${Light_Cyan}-directory ${Light_Purple}-symlink ${Light_Red}-executable\n"

#Aliasing ssh
cx1(){
    echo -en "\e[2 q"
    ssh -XY kjs19@login.cx1.hpc.ic.ac.uk
}
alias gw='ssh -Y kjs19@sshgw.ic.ac.uk'
from_cx1() {
	scp -r kjs19@login.cx1.hpc.ic.ac.uk:/rds/general/user/kjs19/$1/ $2
}
to_cx1() {
	scp -r $1 kjs19@login.cx1.hpc.ic.ac.uk:/rds/general/user/kjs19/$2
}

#Enable bash-completion
#[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

PATH="/usr/local/Cellar/emacs/26.3/bin:$PATH"
export EMACS="/usr/local/Cellar/emacs/26.3/bin/emacs"
PATH="~/.emacs.d/bin:$PATH"

#Replace BSD grep by GNU grep
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

#Replace BSD sed by GNU sed
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

alias grep="grep --color=auto"  

#Enable vim color scheme for tmux
alias tmux="TERM=screen-256color-bce tmux"

#Eliminate duplicates from bash history
export HISTCONTROL=ignoreboth:erasedups

#Add flutter to Path
PATH="$PATH:/Users/kalmanszenes/Code/flutter/bin"

#Configure gromacs
#source /usr/local/gromacs/bin/GMXRC
#export GMXLIB=$HOME/GMXLIB

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

#Path to javafx
export PATH_TO_FX="⁨Users⁩/⁨kalmanszenes⁩/Code/javafx-sdk-11.0.2⁩/lib"

#Set Vim Path 
#PATH="/usr/local/Cellar/vim/8.2.1150/bin:${PATH}"

#Set Python path
PATH="/usr/local/bin:${PATH}"

#Set pg_config path for psycopg2 module in python
PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:${PATH}"

#CP2K path
PATH=${PATH}:/Users/kalmanszenes/Code/cp2k/exe/Darwin-IntelMacintosh-gfortran/cp2k.sopt

#Add yarn to path
PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH="~/scripts:${PATH}"

#bind '"\C-i":"ranger\n"'
#bind '"\C-f":"cd "$(fzf)"\n"'


fzf_f() {
    vim $(find ~/Desktop ~/Documents ~/notes ~/scripts ~/parsers ~/.config -type f | fzf --preview='less {}')
}

fzf_d() {
    cd $(find ~/Desktop ~/Documents ~/notes ~/scripts ~/parsers /.config -type d | fzf)
}

ranger() {
	local IFS=$'\t\n'
	local tempfile="$(mktemp -t tmp.XXXXXX)"
	local ranger_cmd=(
		command
		ranger
		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
	)

	${ranger_cmd[@]} "$@"
	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
		cd -- "$(cat "$tempfile")" || return
	fi
	command rm -f -- "$tempfile" 2>/dev/null
    ls -A
}

h() {
    cd ~;ls -A
}
d() {
    cd ~/Desktop; ls -A
}
D() {
    cd ~/Documents; ls -A
}
p() {
    cd ~/Desktop/cnt; ls -A
}
c() {
    cd ~/code; ls -A
}
s() {
    cd ~/scripts; ls -A
}
n() {
    cd ~/notes; ls -A
}
cfb() {
    vim ~/.bash_profile
}
cfv() {
    vim ~/.vimrc
}
cfr() {
    vim ~/.config/ranger/rc.conf
}
wiki() {
    vim ~/vimwiki/index.md
}
gwiki() {
    cd ~/vimwiki; ls -A
}

# Autocomplete in Atomic Simulation Module
complete -o default -C "/usr/local/opt/python@3.8/bin/python3.8 /usr/local/lib/python3.8/site-packages/ase/cli/complete.py" ase
