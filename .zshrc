# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# variable
BACKUP_DIR="${HOME}/Projects/dot_file"
PROXY_PATH="http://127.0.0.1:7890"

# alias
alias ll="ls -lAhF --color=auto"
alias rm="rm -i"
alias rsync="rsync -aP"
alias update_all="brew update --verbose && brew outdated --greedy --verbose"
alias upgrade_all="brew upgrade && brew cu --all --cleanup --include-mas -y"
alias backup_all="cp ~/.zshrc $BACKUP_DIR && brew bundle dump -f --file $BACKUP_DIR/Brewfile"
alias proxy_on="export http_proxy=${PROXY_PATH}; export https_proxy=${PROXY_PATH}; export all_proxy=${PROXY_PATH}"
alias proxy_off="unset http_proxy https_proxy all_proxy"

# config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
