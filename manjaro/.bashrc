#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

export PATH="$PATH:$HOME/scripts:$HOME/scripts/bmds"

PS1="┌[\`if [ \$? = 0 ]; then echo \[\e[32m\]\:\)\[\e[0m\]; else echo \[\e[31m\]\:\(\[\e[0m\];fi\`]\342\224\200[\[\e[01;49;39m\]\u\[\e[00m\]\[\e[01;49;39m\]@\H\[\e[00m\]]\342\224\200[\[\e[1;49;32m\]\W\[\e[0m\]]\342\224\200[\[\e[1;49;39m\]\$(ls | wc -l) files, \$(ls -lah | grep -m 1 total | sed 's/total //')\[\e[0m\]]\n└╼> "


alias pacup="sudo pacman -Syu"
alias pacS="sudo pacman -S"
alias aup="yaourt -Syu --aur"
alias ll="ls -lh"
alias home="cd ~"
alias kernel="mhwd-kernel -li"
alias yaup="yaourt -Syu --devel --aur"
alias yaS="yaourt -S"
alias sdn="shutdown now"
alias sdrn="shutdown -r now"
alias cdl=". cdl.sh"
alias pegasus="ssh mct30@pegasus2.ccs.miami.edu"
alias untargz="tar -xvzf"
alias targz="tar -cvzf"
alias untar="tar -vzf"
alias sp2="ssh underasail@99.169.153.12"

set -o noclobber

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion	
