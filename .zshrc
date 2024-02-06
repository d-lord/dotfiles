# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh doesn't read ~/.profile by default
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# Workplace stuff lives here and is gitignored.
[[ -e ~/.work.zsh ]] && . ~/.work.zsh

# ============
# editor stuff
# ============

# =
# vim
# lots of other stuff goes through the rice (vice) version
vice_cmd="nvim -u ~/dotfiles/nvim_rice/init.vim"
alias vice=$vice_cmd
alias v=$vice_cmd
if (( $+commands[nvim] )); then
  alias vim=nvim
fi

# vp=vim pager, used with long commands like this: 'bindkey -L | vp'
# allows me to :q the temporary buffer without asking to save it.
# I use '| vim -' all the time. this is shorter and implements the quick-quit too.
# you'd think there would be a buffer-local setting for 'just discard me', but I found this first.
# `bat -p` may turn out to be a better option.
alias vp='vim -c "cnoreabbrev <buffer> q q!" -'

# =
# emacs
alias e='emacsclient -t -a=""'
# heaps of room for improvement; for one, it exits 1 if cwd is not a git repo, and it also keeps the emacs frame after you close magit
alias magit="emacsclient -nw --alternate-editor='' --eval '(magit-status)'"
# this often interrupts my flow when the daemon isn't running, so it's currently disabled:
# export GIT_EDITOR='emacsclient -t -a=""'

# =============
# utility stuff
# =============

# =
# fuzzyfinder
# preview files in ctrl+t by default
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# preview files in ctrl+r by pressing ?
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# sweep up old branches with a multi-select interface
sweep-branches() {
  FZF_DEFAULT_COMMAND="git branch --format ' %(align:70,left)%(refname:short)%(end)%(align:15,left)%(upstream:track)%(end)%(subject)'" \
    fzf --header 'Press TAB to mark, ENTER to delete, ctrl-G to exit' --marker='D' --multi \
        --bind 'enter:execute-silent(git branch -D {+1})+reload(eval "$FZF_DEFAULT_COMMAND")'
}

# =
# bat
# set theme if not already set (eg by terminal settings)
export BAT_THEME="${BAT_THEME-Monokai Extended Origin}"
# use plain style for random pager stuff (`git log`, AWS output, etc).
# this doesn't prevent syntax detection, just removes line numbers and "STDIN" header
export PAGER="bat -p"
# there's room to add custom configs for AWS_PAGER, etc

# =====
# keybinds and zsh config
# see also: .zlogin for config that would be overwritten after this file is read
# =====

# don't require two enter/space when typing !! or !$ to execute the line
# (https://superuser.com/a/1276243/352136)
# see: `man zshoptions`
unsetopt HIST_VERIFY

#
# binds for iTerm's CSI u mode aka libtermkey/libtickit
# https://iterm2.com/documentation-csiu.html
# opt+left and right
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
# I often find myself hitting shift+space by accident
# eg "echo !$ foo" -- between $ and foo I'm often still holding shift
bindkey ";2u" magic-space

# iTerm shell integration mode, if installed
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# pyenv setup. note that this roughly doubles zsh startup time (0.08s to 0.14s)
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi
# speedier version which will probably bite me because it's home-brewed:
alias pyenv='unalias pyenv && eval "$(pyenv init -)" && pyenv $@'

### ================================
### Truecolour terminal shenanigans
### ================================
# To teach a terminal how to use it (ie create a terminfo file):
# https://gitlab.com/skybert/my-little-friends/blob/master/x/xterm-24bit.terminfo
# I have iTerm configured to use xterm-24bit by default.
# If I've set TERM=xterm-24bit in iTerm, downgrade that for ssh - remote hosts probably don't have the terminfo
if [[ "$TERM" == "xterm-24bit" ]]; then
  alias ssh='TERM=xterm-256color ssh';
fi


### =======================
### Basic zsh feature setup (for no oh-my-zsh)
### =======================
# zstyle ':completion:*:*:*:*:*' menu select
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' use-cache yes
# zstyle ':completion:*' cache-path $ZSH/cache
# autoload -Uz compinit && compinit
# autoload -U colors && colors
# bindkey "^R"   history-incremental-search-backward
# bindkey "^[[A" history-beginning-search-backward
# bindkey "^[[B" history-beginning-search-forward
# function parse_git_branch() {
#   branch=$(git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
#   if [[ $branch == "" ]];
#   then
#     :
#   else
#     echo " $branch"
#   fi
# }
# setopt PROMPT_SUBST
# export PROMPT='%F{8}%~%f%F{32}$(parse_git_branch)%f%(?.. %{$fg[red]%}%?%F{reset}) '


### ============================
### oh-my-zsh
### ============================

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf z 1password)

source $ZSH/oh-my-zsh.sh


### ==================
### Misc zshrc options
### ==================

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# == AUTOCOMPLETION
# If wanting to eval & compdef something, put it here (since OMZ has autoloaded compinit), but first check if OMZ already has a plugin for it.

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
