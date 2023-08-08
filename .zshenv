# Don't manipulate PATH in here if it needs to go in front of the system paths. /etc/zprofile is read after this.
# Put PATH stuff in ~/.zprofile instead.

# export PATH='Not here!'

# python
alias python2=/usr/bin/python
alias pip2=/usr/local/bin/pip
alias python=python3
alias pip=pip3

# vim
# $EDITOR is the quick-edit tool, so we use vanilla nvim (core config only)
export EDITOR=nvim

# use neovim as a manpage viewer (syntax highlighting, gO, etc)
export MANPAGER='nvim +Man!'

# use bat by default. can still use cat with `\cat`
alias cat=bat

# jellybeans and reverse
export FZF_DEFAULT_OPTS="--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104 --color info:183,prompt:110,spinner:107,pointer:167,marker:215 --reverse"

# stop blocking my workflow/scripts by showing `less` every so often
AWS_PAGER=bat

# use ripgrep's config file (`man rg`)
export RIPGREP_CONFIG_PATH=~/.rg.conf
