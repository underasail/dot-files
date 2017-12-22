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

module switch python/3.3.1 > /dev/null 2>&1
unset SSH_ASKPASS

export PS1="┌[\`if [ \$? = 0 ]; then echo \[\e[32m\]\:\)\[\e[0m\]; else echo \[\e[31m\]\:\(\[\e[0m\]; fi\`]\342\224\200[\[\e[01;49;39m\]\u\[\e[00m\]\[\e[01;49;39m\]@\H\[\e[00m\]]\342\224\200[\[\e[1;49;32m\]\W\[\e[0m\]]\342\224\200[\[\e[1;49;39m\]\$(ls | wc -l) files, \$(ls -lah | grep -m 1 total | sed 's/total //')\[\e[0m\]]\n└╼> "

export PATH="$PATH:/nethome/mct30/scripts:/nethome/mct30/scripts/bmds:/nethome/mct30/local/lib/python3"

alias ls='ls --color'
alias ll="ls -lh"
alias cdl='. cdl.sh'
alias py3='module switch python/3.3.1'

set -o noclobber

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion	
