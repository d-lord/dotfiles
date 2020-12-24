# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# zsh doesn't read ~/.profile by default
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh


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
export EDITOR='nvim'
export GIT_EDITOR='emacsclient -t -a=\"\"'
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

path+=~/bin

alias uqaws="aws-cli-federator -profile default"

# editor stuff
alias e='emacsclient -t -a=\"\"'
alias vice="nvim -u ~/dotfiles/nvim_rice/init.vim"
if (( $+commands[nvim] )); then
  alias vim=nvim
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# preview files in ctrl+t
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# preview files in ctrl+r by pressing ?
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# doom emacs
path+=~/.emacs.d/bin

mov2mp4 () {
  zparseopts -D -- h=help -help=help
  if [[ -n $help || $# != 1 ]]; then
    echo "Usage: mov2mp4 <filename.mov>"
    echo "mov2mp4 is a simple function to take a .mov video (e.g. a QuickTime screen recording) and turn it into an Apple-compatible .mp4."
    return 1
  else
    ffmpeg -i "$1" -pix_fmt yuv420p "${1%.*}.mp4"
  fi
}

#
# binds for iTerm's CSI u mode aka libtermkey/libtickit
# https://iterm2.com/documentation-csiu.html
# opt+left and right
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
# I often find myself hitting shift+space by accident
# eg "echo !$ foo" -- between $ and foo I'm often still holding shift
bindkey ";2u" magic-space

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
