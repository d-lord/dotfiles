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
            while read heading message; do
            url=`echo \"$message\" | grep -Eo 'https?://[^ >]+' | head -1`;

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
