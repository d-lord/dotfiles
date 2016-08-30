HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
bindkey -e
zstyle :compinstall filename '/Users/dlord/.zshrc'
autoload -Uz compinit
compinit

# homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
# mine
export PATH=$PATH:~/bin

export EDITOR=nvim

# jellybeans and reverse
export FZF_DEFAULT_OPTS="--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104 --color info:183,prompt:110,spinner:107,pointer:167,marker:215 --reverse"
