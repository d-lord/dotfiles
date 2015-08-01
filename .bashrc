# note that OSX reads .bash_profile but not .bashrc;
# so my .bash_profile sources .bashrc

# use PROMPT_COMMAND
shopt -s promptvars
# show command instead of running on !1000
shopt -s histverify

    prompt_last_exit_status () {
	PROMPT_LAST_EXIT_STATUS="${?}";
	if [[ ${PROMPT_LAST_EXIT_STATUS} == "0" ]];
	then
	    PROMPT_LAST_EXIT_STATUS=
	else
	    PROMPT_LAST_EXIT_STATUS="[${PROMPT_LAST_EXIT_STATUS}] "
	fi;
	# PROMPT_LAST_EXIT_STATUS=; # temporary: disable it
    }

prompt_command () {
    prompt_last_exit_status
}
export PROMPT_COMMAND=prompt_command

# Custom bash prompt via kirsle.net/wizards/ps1.html
PS1="\[$(tput setaf 160)$(tput bold)\]\${PROMPT_LAST_EXIT_STATUS}\[$(tput sgr0)\]"
PS1+="\[$(tput setaf 33)$(tput bold)\]\w"
PS1+="\[$(tput sgr0)\] \$ \[$(tput sgr0)\]"
# PS1="\$"
export PS1

# paul irish's prompt (see the file for info)
#source ~/.paul_irish_bash_prompt

# use cd -P and pwd -P by default (follow symlinks' physical path)
set -P
# tmux completion
source ~/.bash/.bash_completion.d/tmux
# any ! combination is automatically expanded on space
bind Space:magic-space

# -- fuzzy completion --
# homebrew's bash_completion package
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
# the script itself: https://github.com/mgalgs/fuzzy_bash_completion
# source ~/bin/fuzzy_bash_completion
# time fuzzy_replace_filedir_xspec
# fuzzy_setup_for_command ls
# fuzzy_setup_for_command cd
# fuzzy_setup_for_command vim
# fuzzy_setup_for_command nvim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
