# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Path Settings
export PATH="${PATH}:/home/fenris/.local/bin"
