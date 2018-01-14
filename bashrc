if command -v brew >/dev/null; then
    if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
        source "$(brew --prefix)/etc/bash_completion"
    fi
fi

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/bash-git-prompt/gitprompt.sh

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
