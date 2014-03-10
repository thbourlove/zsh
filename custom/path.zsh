export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# use autoenv to autoload project virtualenv
if [[ -f "/usr/local/bin/activate.sh" ]]; then
    source /usr/local/bin/activate.sh
elif [[ -d "$HOME/.autoenv" ]]; then
    source "$HOME/.autoenv/activate.sh"
fi
