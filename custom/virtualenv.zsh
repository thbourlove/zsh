if which virtualenvwrapper.sh 1>/dev/null; then
    source virtualenvwrapper.sh

    #Load virtualenvwrapper
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Develop

    # make pip use the same directory for virtualenvs as virtualenvwrapper
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export PIP_RESPECT_VIRTUALENV=true
fi

function autoenv_virtualenv() {
    typeset venv
    venv="$1"
    if [[ "${VIRTUAL_ENV:t}" != "$venv" ]]; then
        # verify virtualenvwrapper installed
        if which virtualenvwrapper.sh 1>/dev/null; then
            source virtualenvwrapper.sh
        else
            echo "ERROR: virtualenvwrapper not installed."
            exit $?
        fi

        # activate or create virtualenv
        if workon | grep -q "^$1$"; then
            workon $1
        else
            echo -n "$1 doesn't exist, creat now? [y/N] "
            read answer
            if [[ "$answer" == "y" ]]; then
                mkvirtualenv $1
                if [[ -e "requirements.txt" ]]; then
                    pip install -U -r requirements.txt
                fi
            fi
        fi
    fi
}
