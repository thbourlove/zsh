export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

if [[ -f "/usr/local/bin/brew" ]]; then
    if [[ -d "$(brew --prefix coreutils)" ]]; then
        export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
        export MANPATH=$(brew --prefix coreutils)/libexec/gnuman:$MANPATH
    fi

    if [[ -d "/usr/local/share/python" ]]; then
        export PATH=/usr/local/share/python:$PATH
    fi

    if [[ -d "$(brew --prefix ruby)" ]]; then
        export PATH=$(brew --prefix ruby)/bin:$PATH
    fi

    if [[ -d "/usr/local/share/npm/bin" ]]; then
        export PATH=$PATH:"/usr/local/share/npm/bin"
    fi

    if [[ -f "$(brew --prefix)/etc/grc.bashrc" ]]; then
        source "$(brew --prefix)/etc/grc.bashrc"
    fi
fi

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

if [[ -d "/usr/bin/core_perl/" ]]; then
    export PATH=$PATH:"/usr/bin/core_perl"
fi

if [[ -d "$HOME/Library/Haskell/bin" ]]; then
    export PATH="$HOME/Library/Haskell/bin":$PATH
fi

# test android sdk
if [[ -d "$HOME/tools/android/platform-tools" ]]; then
    export PATH=$HOME/tools/android/platform-tools:$HOME/tools/android/platform:$HOME/tools/android/tools:$PATH
fi

# test user bin
if [[ -d "$HOME/bin" ]]; then
    export PATH=$HOME/bin:$PATH
fi

# use autoenv to autoload project virtualenv
if [[ -f "/usr/local/bin/brew" ]]; then
    if [[ -d "$(brew --prefix autoenv)" ]]; then
        source $(brew --prefix autoenv)/activate.sh
    fi
elif [[ -d "$HOME/.autoenv" ]]; then
    source "$HOME/.autoenv/activate.sh"
fi
