# Homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

alias python2=/usr/bin/python
alias pip2=/usr/local/bin/pip
alias python=python3
alias pip=pip3

# mine
export PATH=~/bin:$PATH

# doom emacs
export PATH=$PATH:~/.emacs.d/bin

# use neovim as a manpage viewer (syntax highlighting, gO, etc)
export MANPAGER="nvim -c 'set ft=man' -"

# use bat instead. can still use cat with `\cat`
alias cat=bat

# jellybeans and reverse
export FZF_DEFAULT_OPTS="--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104 --color info:183,prompt:110,spinner:107,pointer:167,marker:215 --reverse"

