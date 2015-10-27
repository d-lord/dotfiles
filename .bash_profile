# load config from .bashrc
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# Homebrew
export PATH=/usr/local/bin:$PATH

# mine
export PATH=$PATH:~/bin

# NeoVim - only available on iTerm nightly build (as of 2 Apr 2015)
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export EDITOR=nvim

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

irssi_notifier() {
    ssh dal@howbad.ru 'echo -n "" > ~/.irssi/fnotify; tail -f ~/.irssi/fnotify' | \
            while read -r heading message; do
            url=$(echo \""$message"\" | grep -Eo 'https?://[^ >]+' | head -1);

            if [ ! "$url" ]; then
                terminal-notifier -title "\"$heading\"" -message "\"$message\"" -activate com.apple.Terminal;
            else
                terminal-notifier -title "\"$heading\"" -message "\"$message\"" -open "\"$url\"";
            fi;
        done
    }

export CLICOLOR=1
# please, find something less eye-watering
export LSCOLORS="ExFxCxDxBxexexabaGaCad"
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

cd () 
{ 
    builtin cd "$*";
    ls;
}

alias rc='source ~/.bashrc'

# this seems to interact poorly with fzf (see bashrc)
# source /Users/David/.iterm2_shell_integration.bash

# http://serverfault.com/a/695107/262337
# to action e.g. the command labelled 180, run !180
alias h='history|grep'

# installed from Docker Toolkit
alias docker-shell='source "/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh"'
# cleanup: http://jimhoskins.com/2013/07/27/remove-untagged-docker-images.html
# tr|cut could be replaced by awk '{print $3}'
alias docker-clean='docker-clean-1 && docker-clean-2'
alias docker-clean-1='docker rm $(docker ps -a -q)'
alias docker-clean-2='docker rmi $(docker images | grep "<none>" | tr -s " " | cut -d" " -f3)'
dbuild() {
    if [[ -z "$1" ]]; then
        echo "dbuild needs an argument" >&2
        return
    fi
    docker build -t "${1%%+(/)}" "$HOME/docker/$1"
}

# 2310 violation count per folder
viol() {
    watch -n 5 grep -r '"^\["' . \| cut -f2 -d':' \| cut -f1 -d'" "' \| sort \| uniq -c
}
