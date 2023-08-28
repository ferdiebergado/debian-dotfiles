# .bashrc
### CONFIG ###

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Disable completion when the input buffer is empty.  i.e. Hitting tab
# and waiting a long time for bash to expand all of $PATH.
shopt -s no_empty_cmd_completion

# Enable history appending instead of overwriting when exiting.  #139609
shopt -s histappend

# History buffer and file size
export HISTSIZE=11000
export HISTFILESIZE=11000

# Auto "cd" when entering just a path
shopt -s autocd

# Enable vi mode
set -o vi

# aliases
. "$HOME/.bash_aliases"

# functions
. "$HOME/.bash_functions"

# lf icons
. "$HOME/.config/lf/lfenv.sh"

export LESS='-R --use-color -Dd+r$Du+b'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export EDITOR=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# colored sudo prompt
export SUDO_PROMPT="$(tput setab 1 setaf 7 bold)[sudo]$(tput sgr0) $(tput setaf 6)password for$(tput sgr0) $(tput setaf 5)%p$(tput sgr0): "

# enable bash completion in interactive shells
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# enable bash completion for dotgit
. /usr/share/bash-completion/completions/git
__git_complete dotgit __git_main

# fzf tab completion
source "$HOME/Scripts/fzf-tab-completion/bash/fzf-bash-completion.sh"
bind -x '"\t": fzf_bash_completion'

# history completion
bind '"\e[A": history-substring-search-backward'
bind '"\e[B": history-substring-search-forward'

# terminal colors
normal=$'\033[0m'
yellow=$'\033[33m'
cyan=$'\033[36m'

# set the current command as the window title
trap 'echo -ne "\033]0;${BASH_COMMAND%% *}\007"' DEBUG

# If we're disconnected, capture whatever is in history
trap 'history -a' SIGHUP

update_title() {
	if [[ -n "$BASH_COMMAND" ]]; then
		echo -en "\033]0;$(basename "${PWD}")\007"
	fi
}

# set the prompt command
export PROMPT_COMMAND='update_title'

# git prompt
load_plugin "$HOME/Scripts/git-prompt.sh"

# set the command prompt
export PS1='\[${cyan}\]\w\[${normal}${yellow}\]$(__git_ps1 "  %s")\[${normal}\] \$ '

# show distroname
grep -i pretty /etc/os-release | cut -d= -f2 | tr -d "\""

# show kernel info
uname -sr

# activate dircolors
test -r ~/.dircolors && eval "$(dircolors ~/.dircolors)"
