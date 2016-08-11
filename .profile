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

export HISTFILESIZE=999999999999
export HISTSIZE=99999999999


###
### Aliases
#############
# alias aivodb='mysql -A aivo -uroot'
alias l='ls -l'
alias retouch="kill -9 `ps aux |grep Jitouch |grep Library |awk {'print $2'}` && screen /Library/PreferencePanes/Jitouch.prefPane/Contents/Resources/Jitouch.app/Contents/MacOS/Jitouch"
alias push="git pull --rebase && git push"