export PATH=/usr/local/bin:/usr/local/share/aclocal:/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH
# export PATH=/Applications/XAMPP/xamppfiles/bin:$PATH

export PATH="/usr/local/sbin:$PATH"


export NODE_PATH=/usr/local/lib/node_modules
export EDITOR='subl -w'

# alias aivodb='mysql -A aivo -uroot'

alias l='ls -l'

export CLICOLOR=true
export GITAWAREPROMPT=~/scripts/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export PS1="
\[\e[0;31m\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] \[\e[2;33m\] \t\[$txtrst\]
\[$txtred\]❤\[$txtrst\] "

export LANG="pl_PL.UTF-8"

export HISTFILESIZE=999999999999
export HISTSIZE=99999999999