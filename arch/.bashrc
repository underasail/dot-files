#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias cdl='. cdl'
alias pacup="sudo pacman -Syu"
alias pacS="sudo pacman -S"
alias ll="ls -l"
alias lla="ls -l -a"
alias home="cd ~"
alias yaup="yaourt -Syu --devel --aur"
alias yaS="yaourt -S"
alias sdn="shutdown now"
alias sdrn="shutdown -r now"

# Path Extension
export PATH=$PATH:$HOME/scripts

# Don't fuck up
set -o noclobber

# Prompt Customization
## Uncomment below line for original Arch prompt
# PS1='[\u@\h \W]\$ '
# PS1='\l > \h > \u > \W >\n\@ \\$\[$(tput sgr0)\] '
PS1="┌[\`if [ \$? = 0 ]; then echo \[\e[32m\]\:\)\[\e[0m\]; else echo \[\e[31m\]\:\(\[\e[0m\];fi\`]\342\224\200[\[\e[01;49;39m\]\u\[\e[00m\]\[\e[01;49;39m\]@\H\[\e[00m\]]\342\224\200[\[\e[1;49;32m\]\W\[\e[0m\]]\342\224\200[\[\e[1;49;39m\]\$(ls | wc -l) files, \$(ls -lah | grep -m 1 total | sed 's/total //')\[\e[0m\]]\n└╼> "

#
# ~/.bashrc
#
