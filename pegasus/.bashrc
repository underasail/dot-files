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

module switch python/3.6.5 > /dev/null 2>&1
module switch perl/5.22.1 > /dev/null 2>&1
module switch gcc/5.5.0 > /dev/null 2>&1
module load java/1.8.0_60 R/3.3.1

unset SSH_ASKPASS
eval $(ssh-agent -s) > /dev/null 2>&1
ssh-add ~/.ssh/bmds_id_rsa > /dev/null 2>&1

export PS1="┌[\`if [ \$? = 0 ]; then echo \[\e[32m\]\:\)\[\e[0m\]; else echo \[\e[31m\]\:\(\[\e[0m\]; fi\`]\342\224\200[\[\e[01;49;39m\]\u\[\e[00m\]\[\e[01;49;39m\]@\H\[\e[00m\]]\342\224\200[\[\e[1;49;32m\]\W\[\e[0m\]]\342\224\200[\[\e[1;49;39m\]\$(ls | wc -l) files, \$(ls -lah | grep -m 1 total | sed 's/total //')\[\e[0m\]]\n└╼> "

export PATH="$PATH:/nethome/mct30/scripts:/nethome/mct30/scripts/bmds:/nethome/mct30/local/lib/python3:/nethome/mct30/local/parallel/bin:/nethome/mct30/local/bcftools/bin:/nethome/mct30/local/pymol:/nethome/mct30/local/samtools/bin:/nethome/mct30/local/gnuplot/bin:/nethome/mct30/local/miranda/bin:/nethome/mct30/local/rnahybrid/bin:/nethome/mct30/local/gffread/gffread-0.9.12:/nethome/mct30/local/bedtools/bedtools2/bin:/nethome/mct30/local/meme/bin:/nethome/mct30/local/rosetta/rosetta_bin_linux_2017.08.59291_bundle/main/source/bin:/nethome/mct30/local/rstudio/rstudio-0.98.1103/bin:/nethome/mct30/local/fiji/Fiji.app"

alias ls='ls --color'
alias ll="ls -lh"
alias cdl='. cdl.sh'
alias py3='module switch python/3.3.1'

set -o noclobber

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
