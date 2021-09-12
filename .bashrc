# ~/.bashrc
#
export LC_CTYPE=en_US.UTF-8
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# >>> conda initialize >>>
#!! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/fenris/Apps/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/fenris/Apps/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/fenris/Apps/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/fenris/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Conda Virtual Envs
alias scraper='conda activate scraper;export PATH="/home/fenris/Apps/anaconda3/envs/scraper/bin/:$PATH"'
alias ML='conda activate ML;export PATH="/home/fenris/Apps/anaconda3/envs/ML/bin/:$PATH"'
alias web='conda activate webapp;export PATH="/home/fenris/Apps/anaconda3/envs/webapp/bin/:$PATH"'
alias gui='conda activate gui;export PATH="/home/fenris/Apps/anaconda3/envs/gui/bin/:$PATH"'

# basic commands
shopt -s autocd
shopt -s cdspell # autocorrects cd misspellings
bind "set completion-ignore-case on"
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control


### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# ls
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# random
alias q='exit'
alias c='clear'
alias h='history'
alias cs='clear;exa -al --color=always --group-directories-first'
alias cat='bat'

# git
alias gcl='git clone '
alias gp='git pull'
alias ga='git add '
alias gc='git commit -m '
alias gd='git push'

# Dotfiles Git
alias dg='/usr/bin/git --git-dir=/home/fenris/.cfg/ --work-tree=/home/fenris'
alias dga='/usr/bin/git --git-dir=/home/fenris/.cfg/ --work-tree=/home/fenris add'
alias dgc='/usr/bin/git --git-dir=/home/fenris/.cfg/ --work-tree=/home/fenris commit -m '
alias dgp='/usr/bin/git --git-dir=/home/fenris/.cfg/ --work-tree=/home/fenris push'

# python
alias pp='python3'
alias pins='pip3 install '

# easy edits
alias vimrc='nvim ~/.vimrc'
alias bashrc='nvim ~/.bashrc'
alias vim='nvim'

# pacman shortcuts
alias ins='sudo pacman -S '
alias insy='yay -S '
alias unins='sudo pacman -Rsu '
alias uninsy='yay -Rsu'
alias update='sudo pacman -Syu'
alias updatey='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias tlmgr='tllocalmgr install'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# flags 
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# youtube-dl
alias ytab="youtube-dl --extract-audio --audio-format best "
alias ytall="youtube-dl --extract-audio --audio-format flac "
alias ytam="youtube-dl --extract-audio --audio-format mp3 "
alias ytv="youtube-dl -f bestvideo+bestaudio "

# Useful curls.
alias rr='curl -s -L https://bit.ly/2VRgukx | bash'

# shortcuts
alias cleanup='sudo bash /etc/init.d/cleanup.sh'
alias r='clear;sudo -s'
alias dark='cd ~/Apps/tools; conda activate xxx;export PATH="/home/fenris/Apps/anaconda3/envs/xxx/bin/:$PATH"'
alias jyp='jupyter notebook'
alias bye='shutdown now'
alias nf='c;neofetch'
alias listpkg='expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqen | sort) <({ pacman -Qqg base-devel; expac -l '\n' '%E' base; } | sort | uniq)) | sort -n'
alias cm='cmatrix -Bras'
alias sys='bpytop'
alias btime='systemd-analyze'
alias btimeb='systemd-analyze blame'
alias btimecc='systemd-analyze critical-chain'
alias qc='cd /home/fenris/work/dead/Quicky/; code .'
alias det='pacman -Qi'
alias nu='vnstat -d 1'

# timer app
timer() {
        local N=$1; shift
        (sleep $N && mpg123 -q /home/fenris/Apps/dotfiles/monkey.mp3) &&
        echo "timer set for $N"
}

# ESP-IDF for ESP32 
alias idfBegin='idf.py set-target esp32;idf.py menuconfig --style monochrome'
alias idfBuild='idf.py build;idf.py -p /dev/ttyUSB0 -b 460800 flash'
alias idfMonitor='idf.py -p /dev/ttyUSB0 monitor'
