# load config from .bashrc
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi


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
lock() {
    sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "$1";
}

export CLICOLOR=1
# please, find something less eye-watering
export LSCOLORS="ExFxCxDxBxexexabaGaCad"
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

cd () 
{ 
    builtin cd "$*" && ls;
}

# emacs --daemon
alias emc='emacsclient -c'

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
    # build is very verbose even with --quiet. errors still go to stderr so we silence stdout
    docker build -t "${1%%+(/)}" "$HOME/docker/$1" #>/dev/null
}
drun() { # start container with the specified entrypoint and colour terminal
    if [[ $# -lt 2 ]]; then
        echo "drun needs 2+ arguments: image entrypoint" >&2
        return
    fi
    docker run -ti -e "TERM=xterm-256color" "$@"
}
drmi() {
  tmp=$(docker images | fzf --header-lines=1 -n1,2 -m | awk '{print $3}')
  for image in $tmp; do
    docker rmi "$image"
  done
}
# Docker completion in bash
function _dbuild_complete() {
  pushd ~/docker >/dev/null; # can this be avoided?
  tmp=(${2}*/);            # can this be done in one op?
  COMPREPLY=(${tmp[@]%/}); # can this be done in one op?
  popd >/dev/null;
}
complete -o nospace -F _dbuild_complete dbuild

# 2310 style violation count per folder
viol() {
    watch -n 5 grep -r '"^\["' . \| cut -f2 -d':' \| cut -f1 -d'" "' \| sort \| uniq -c
}
