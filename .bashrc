# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH=/home/sgronlu/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="rr"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Uncomment the following line if you do not want OMB to overwrite the existing
# aliases by the default OMB aliases defined in lib/*.sh
# OMB_DEFAULT_ALIASES="check"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
  npm
  battery
)

# Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: 
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"


# "Stolen" and modified from https://github.com/sayanarijit/pomo, wonderful snippet :)
function pomo() {
    arg1=$1
    arg2=$2
    cycles=$3

    work=${arg1:?Example: pomo 45 15 }
    split=$((work * 60))
    pause=${arg2:?Example: pomo 45 15}
    break=$((pause * 60))
    wrkmsg="Pomodoro over"
    brkmsg="Break over"
    
    if test -z "$cycles" 
    then
      
      while true; do
          echo "(${work})/(${pause}) Pomodoro started" 
          sleep "${split:?}" && notify-send -u critical -t 0 -a pomo "$wrkmsg"
          sleep "${break:?}" && notify-send -u critical -t 0 -a pomo "$brkmsg"
      done
    else
      
      for ((i=0; i < $cycles; ++i))
      do
          declare -i temp=1
          echo "Cycle $((i + temp)) of $cycles (${work})/(${pause}) Pomodoro started"
          sleep "${split:?}" && notify-send -u critical -t 0 -a pomo "$wrkmsg"
          sleep "${break:?}" && notify-send -u critical -t 0 -a pomo "$brkmsg"
      done
    fi
}


#https://askubuntu.com/questions/1212722/unable-to-launch-evince fix stupid evince bug with default applications

export PATH="${PATH}:${HOME}/.local/bin/"
# export PATH="${PATH}:${HOME}/.cargo/bin/"

# Access windows partition more easily
alias windev="code /media/sgronlu/OS/Users/frost/Desktop/Utveckling/"
alias winuni="code /media/sgronlu/OS/Users/frost/Desktop/Universitetet/"
alias vault="code /media/sgronlu/OS/Users/frost/Desktop/obNotes/"
# Ease updating all the packages
alias up="sudo snap refresh && sudo apt update && sudo apt upgrade"
alias updot="cp ~/.bashrc ~/Dev/dotfiles/.bashrc && cp ~/.config/alacritty/alacritty.yml ~/Dev/dotfiles/alacritty.yml"

(cat ~/.cache/wal/sequences &)
. "$HOME/.cargo/env"
source /home/sgronlu/Dev/alacritty/extra/completions/alacritty.bash

export PATH=$PATH:/home/sgronlu/.spicetify
