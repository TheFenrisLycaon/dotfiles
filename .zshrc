# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/fenris/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vscode
  python
  dotenv
  docker
  zsh-syntax-highlighting 
  zsh-autosuggestions
  docker-compose
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
alias vin='conda activate vin;export PATH="/home/fenris/Apps/anaconda3/envs/vin/bin/:$PATH"; cd /home/fenris/work/IN\ -\ vInnovate/'
alias arima='conda activate arima;export PATH="/home/fenris/Apps/anaconda3/envs/arima/bin/:$PATH"; cd /home/fenris/work/IN\ -\ Arima'

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
alias zshrc='nvim ~/.zshrc'
alias vim='nvim'

# pacman shortcuts
alias ins='sudo pacman -S --needed --color always'
alias insy='yay -S --color always'
alias unins='sudo pacman -Rsu --color always'
alias uninsy='yay -Rsu --color always'
alias update='sudo pacman -Syu --color always'
alias updatey='yay -Sua --noconfirm --color always'              # update only AUR pkgs (yay)
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
alias igsync='dark;cd .scrape;instaloader --no-captions --no-metadata-json --no-video-thumbnails --highlights --igtv -s --login xoxo_steffany_oxox'

# timer app
timer() {
        local N=$1; shift
        (sleep $N && mpg123 -q /home/fenris/Apps/dotfiles/monkey.mp3) &&
        echo "timer set for $N"
}

# ESP-IDF for ESP32 
alias idfBegin='idf.py set-target esp32;idf.py menuconfig --style monochrome'
alias idfBuild='idf.py build'
alias idfFlash='idf.py -p /dev/ttyUSB0 -b 460800 flash'
alias idfMonitor='idf.py -p /dev/ttyUSB0 monitor'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load Elixir Support

alias loadex='. $HOME/.asdf/asdf.sh;. $HOME/.asdf/completions/asdf.bash'

export LC_CTYPE=en_IN.UTF-8
export LC_ALL=en_IN.UTF-8
