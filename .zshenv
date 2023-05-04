# Homebrew
if [[ $(uname -p) == 'arm' ]]; then
  export PATH=/opt/homebrew/bin:$PATH
  export PATH=/opt/homebrew/sbin:$PATH
else
  export PATH=/usr/local/bin:$PATH
  export PATH=/usr/local/sbin:$PATH
fi

# python
alias python2=/usr/bin/python
alias pip2=/usr/local/bin/pip
alias python=python3
alias pip=pip3

# vim
# $EDITOR is the quick-edit tool, so we use vanilla nvim (core config only)
export EDITOR=nvim

# mine
export PATH=~/bin:$PATH

# doom emacs
export PATH=$PATH:~/.config/emacs/bin

# use neovim as a manpage viewer (syntax highlighting, gO, etc)
export MANPAGER='nvim +Man!'

# use bat instead. can still use cat with `\cat`
alias cat=bat

# jellybeans and reverse
export FZF_DEFAULT_OPTS="--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104 --color info:183,prompt:110,spinner:107,pointer:167,marker:215 --reverse"

# stop blocking my workflow/scripts by showing `less` every so often
AWS_PAGER=bat

# use ripgrep's config file (`man rg`)
export RIPGREP_CONFIG_PATH=~/.rg.conf
