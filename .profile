export PATH=/usr/local/bin:/usr/local/share/aclocal:/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH
# export PATH=/Applications/XAMPP/xamppfiles/bin:$PATH

export PATH="/usr/local/sbin:$PATH"


export NODE_PATH=/usr/local/lib/node_modules
export EDITOR='subl -w'

export CLICOLOR=true
export GITAWAREPROMPT=~/dotfiles/scripts/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export PS1="
\[\e[0;31m\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] \[\e[2;33m\] \t\[$txtrst\]
\[$txtred\]❤\[$txtrst\] "

export LANG="pl_PL.UTF-8"

# Bash history
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


###
### Aliases
#############
# alias aivodb='mysql -A aivo -uroot'
alias l='ls -l'

function retouchFn {
    ps aux |grep Jitouch |grep Library |awk {'print $2'}
}

alias retouch="kill -9 `retouchFn` && screen /Library/PreferencePanes/Jitouch.prefPane/Contents/Resources/Jitouch.app/Contents/MacOS/Jitouch"
alias push="git pull --rebase && git push"
alias flatten-directory="find . -mindepth 2 -type f -exec mv -i '{}' . ';'"


# pretty man pages
man() {
	env \
		LESS_TERMCAP_md=$'\e[1;36m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[1;40;92m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[1;32m' \
			man "$@"
}