# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bullet-train"

DISABLE_UPDATE_PROMPT="true"

plugins=(
  git
  aws
  minikube
  colored-man-pages
  colorize
  terraform
  vagrant
  zsh-syntax-highlighting
  zsh-autosuggestions
)

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nano'
fi

alias switch="sudo nixos-rebuild switch"
alias search="nix search nixpkgs"
alias garbage="nix-collect-garbage --delete-old"

alias ld="eza -lD"
alias lf="eza -lF --color=always | grep -v /"
alias lh="eza -dl .* --group-directories-first"
alias ll="eza -al --group-directories-first"
alias ls="eza -alF --color=always --sort=size | grep -v /"
alias lt="eza -al --sort=modified"

# Terraform
alias tfi="terraform init"
alias tfv="terraform validate"
alias tfc="terraform console"
alias tfp="terraform plan"
alias tff="terraform fmt"
alias tfa="terraform apply"
alias tfd="terraform destroy"

# Git
alias gi="git init"
alias gs="git status -sbu"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gp="git push"
alias gm="git merge"
alias ga="git add ."
alias gcm="git commit -m"
alias gpl="git pull"
alias gst="git stash"
alias gstl="git stash list"
alias glg='git log --graph --oneline --decorate --all'

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(curl -sL init.zshell.dev); zzinit

BULLETTRAIN_PROMPT_ORDER=(
  time
  git
  dir
  status
  aws
)

precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}
