
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
#########################################################
# MacOSX 不會使用 ~/.bashrc , Linux 則在開 shell 時載入 #
#########################################################
export NVM_DIR="/Users/eric/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Drone Server CLI
export DRONE_SERVER=http://drone.itiman.tw
export DRONE_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZXh0IjoiaGFycmlzd2FuZyIsInR5cGUiOiJ1c2VyIn0.mq3YE4L-FDitJkVLoyw3s_XMu8LxM-_TyIRffLOXl2A

alias drone-gama='DRONE_SERVER=http://192.168.123.121:8000 DRONE_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZXh0IjoiaGFycmlzd2FuZyIsInR5cGUiOiJ1c2VyIn0.Qq2gq9jYJk8AXxxTYJ5UUuiu8nxEPtTZFSzOYKlNbWM drone'

##### Alias
[ -s "$HOME/sh/alias.sh" ] && source "$HOME/sh/alias.sh"
[ -s "$HOME/rc.d/alias.sh" ] && source "$HOME/rc.d/alias.sh"
###########

#export KUBECONFIG=/Users/eric/.kube/config:/Users/eric/.kube/ocms-v2-preprod.config
export KUBECONFIG=${HOME}/.kube/config:`find "$(readlink ${HOME}/.kube)" -type f | grep -Ei "\.config$" | paste -s -d: -`
###########

#export KUBECONFIG=/Users/eric/.kube/config:/Users/eric/.kube/ocms-v2-preprod.config
export KUBECONFIG=${HOME}/.kube/config:`find "$(readlink ${HOME}/.kube)" -type f | grep -Ei "\.config$" | paste -s -d: -`

# 文件快速搜尋
[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash


#PHPBrew
#export PHPBREW_SET_PROMPT=1
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
#source /Users/eric/.phpbrew/bashrc

# 97 iOS fastlane

export FASTLANE_USER="hao@sdkelake.com"
export FASTLANE_PASSWORD="Ohendkeo8305"
export SPACESHIP_2FA_SMS_DEFAULT_PHONE_NUMBER="+886955910129"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
