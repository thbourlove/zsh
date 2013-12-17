#alias
export PYTHONPATH=/usr/local/lib/python2.7

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias lg='ll | grep'
alias pg='ps aux | grep'

alias gre='git rebase'
compdef _git gre=git-rebase

alias df='df -h'
alias tmux='tmux -2'
alias tmuxa='tmux a || tmux'

#correction
unsetopt correct_all

# basic env settings for OSX
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CLICOLOR=1

# bind key
export EDITOR=vim
bindkey -v
bindkey jk vi-cmd-mode
bindkey -r "^["

function man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# auto verify add config git user name and email
function git_user_verify() {
    if [[ -d ".git" ]]; then
        if ! git config --get user.name 1>/dev/null; then
            echo -n "Git user.name not configured, please enter your name: "
            read name
            if [[ -n $name ]]; then
                git config user.name $name
            else
                echo "name empty, not configured."
            fi
        fi

        if ! git config --get user.email 1>/dev/null; then
            echo -n "Git user.email not configured, please enter your email: "
            read email
            if [[ -n $email ]]; then
                git config user.email $email
            else
                echo "email empty, not configured."
            fi
        fi
    fi
}

function cd() {
    if builtin cd "$@"; then
        autoenv_init
        git_user_verify
        return 0
    else
        return $?
    fi
}
