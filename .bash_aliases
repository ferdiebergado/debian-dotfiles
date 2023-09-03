# vim:ft=sh

# enable color support for common commands
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

alias df='df -h'
alias netmon='watch lsof -P -i -n'
alias matrix='tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias gtree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/ | /'"
alias pin='pass insert'
alias ped='pass edit'
alias randmac="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'"
alias topdir='du -hs */ | sort -hr | head'
alias which='command -v'
alias e=nvim
alias se=sudoedit
alias mkdir='mkdir -pv'
alias md=mkdir
alias h=helix
alias mount='mount |column -t'
alias wget='wget -c'
alias df='df -H'
alias du='du -ch'
alias ..='cd ..'
alias sudo='sudo -E'

# git
alias gitc='git clone'
alias gits='git status'
alias gitp='git push'
alias gitl='git log'
# removes files listed in .gitignore
alias gcgi='git clean -Xfd'
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# list all date string format
alias dateh='date --help|sed -n "/^ *%%/,/^ *%Z/p"|while read l;do F=${l/% */}; date +%$F:"|'"'"'${F//%n/ }'"'"'|${l#* }";done|sed "s/\ *|\ */|/g" |column -s "|" -t'

alias l='lsd'

# retrieve Windows product key
alias winpk='sudo strings /sys/firmware/acpi/tables/MSDM | tail -n 1'
alias clr='clear'

# browse files and edit
alias lse='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" --print0 | xargs -0or $EDITOR'

# cat with highlighting
alias cath='highlight -s kellys -O truecolor --force'

# show aliases with highlighting
alias aliases='alias -p | cath -S bash'

# download from github
alias gitdl='curl -LJO'

# download audio
alias getsong='yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail -P temp:/tmp'
